{
  description = "JNL global tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    neovim-nightly,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.buildEnv {
      name = "jed-tools";
      paths = with pkgs; [
        # Main tools
        neovim-nightly.packages.${system}.default
        tmux

        # Programming languages
        (luajit.withPackages (ps: [ps.fennel]))

        # LSPs
        clang-tools # clangd + clang_format
        lua-language-server
        gopls
        biome
        pyright
        nil
        vscode-langservers-extracted # html LSP
        fennel-ls

        # Formatters
        stylua
        fnlfmt
        python313Packages.black
        alejandra # opinionated nix formatter

        # Dev tools
        direnv
        devenv
        nix-direnv
        gnumake
        cmake

        # CLI
        ripgrep
        fd
        jq
      ];
    };
  };
}
