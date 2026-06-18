{ lib, pkgs, ... }:
{
    home = {
        packages = with pkgs; [
            hello
            make
        ];

    username = "ntreml";
    homeDirectory = "/home/ntreml";

    # never change this ever
    stateVersion = "26.05";
    };
}
