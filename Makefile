.PHONY: update
update:
	home-manager switch --flake .#ntreml
.PHONY: clean
clean:
	nix-collect-garbage -d
