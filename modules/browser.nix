{ nur, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # vimium
    ];
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      extensions = {
        packages = with nur.repos.rycee.firefox-addons; [
          ublock-origin
          vimium
          bitwarden
          sponsorblock
        ];
      };
    };
  };
}
