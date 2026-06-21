{ pkgs, ... }:

let
  setup-eduroam = pkgs.writeShellApplication {
    name = "setup-eduroam";

    # This automatically makes 'openssl' and 'nmcli' available to the script
    runtimeInputs = with pkgs; [
      openssl
      networkmanager
    ];

    text = ''
      # Ensure the script is run as root
      if [ "$EUID" -ne 0 ]; then
        echo "Error: Please run this script as root (e.g., using sudo)."
        exit 1
      fi

      # Check for correct number of arguments
      if [ "$#" -ne 2 ]; then
        echo "Usage: setup-eduroam <path-to-p12-file> <your_username@your_university.edu>"
        echo "Example: sudo setup-eduroam /home/user/Downloads/cert.p12 myuser@uni.edu"
        exit 1
      fi

      P12_FILE="$1"
      IDENTITY="$2"
      CERT_DIR="/etc/ssl/certs/eduroam"

      if [ ! -f "$P12_FILE" ]; then
        echo "Error: Certificate file '$P12_FILE' not found."
        exit 1
      fi

      echo "Creating secure directory at $CERT_DIR..."
      mkdir -p "$CERT_DIR"
      chmod 700 "$CERT_DIR"

      echo "Extracting client certificate..."
      openssl pkcs12 -in "$P12_FILE" -nokeys -out "$CERT_DIR/cert.pem" -legacy -passin pass:

      echo "Extracting private key..."
      openssl pkcs12 -in "$P12_FILE" -nocerts -nodes -out "$CERT_DIR/private.key" -legacy -passin pass:

      echo "Setting strict file permissions..."
      chmod 600 "$CERT_DIR/private.key"
      chmod 644 "$CERT_DIR/cert.pem"

      echo "Clearing existing eduroam profiles (if any)..."
      nmcli connection delete eduroam 2>/dev/null || true

      echo "Adding new eduroam profile for $IDENTITY..."
      nmcli connection add \
        type wifi \
        con-name "eduroam" \
        ssid "eduroam" \
        wifi-sec.key-mgmt wpa-eap \
        802-1x.eap tls \
        802-1x.identity "$IDENTITY" \
        802-1x.client-cert "$CERT_DIR/cert.pem" \
        802-1x.private-key "$CERT_DIR/private.key"

      echo "Activating eduroam connection..."
      nmcli connection up eduroam

      echo "Setup complete."
    '';
  };
in
{
  home.packages = [
    setup-eduroam
  ];
}
