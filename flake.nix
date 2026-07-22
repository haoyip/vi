{
  description = "Hao's Neovim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";

    bacon-ls = {
      url = "github:crisidev/bacon-ls";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    # Define the systems you want to support
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    # A helper function to generate outputs for each system
    # It imports nixpkgs for the system and passes the resulting 'pkgs' to the function 'f'
    forAllSystems = f:
      nixpkgs.lib.genAttrs supportedSystems (
        system:
          f (import nixpkgs {
            inherit system;
            overlays = [
              inputs.bacon-ls.overlay.${system}
            ];
          })
      );
  in {
    # Use the helper to generate the packages attribute for every system
    packages = forAllSystems (
      pkgs: let
        pkgList = with pkgs; [
          # language server
          bacon-ls
          docker-compose-language-service
          dockerfile-language-server
          lua-language-server
          marksman
          nil
          phpantom-lsp
          rust-analyzer
          tailwindcss-language-server
          tofu-ls
          tombi
          typescript-language-server
          vscode-langservers-extracted
          vtsls
          vue-language-server
          yaml-language-server

          # formatter
          alejandra
          hadolint
          markdown-toc
          markdownlint-cli2
          rustfmt
          shfmt
          stylua
          xmlformat

          # other tools
          fzf
          gcc
          gnumake
          imagemagick
          ripgrep
          tree-sitter
        ];
      in {
        default = inputs.wrappers.wrappers.neovim.wrap {
          inherit pkgs;
          env = {
            "CONFIG_ROOT" = ./.;
            "NVIM_APPNAME" = "nvim-hao-remote";
          };
          runtimePkgs = pkgList;
          settings.config_directory = ./.;
        };
      }
    );
  };
}
