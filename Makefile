.PHONY: update
update:
	home-manager switch --flake .#ntreml
.PHONY: update-wsl
update-wsl:
	home-manager switch --flake .#ntreml@wsl
.PHONY: clean
clean:
	nix-collect-garbage -d
