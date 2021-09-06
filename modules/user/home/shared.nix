{ pkgs, config, ... }:
{
  # Default user configuration
  nixpkgs.config = import ../../pkgs/config.nix;

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    initExtra = builtins.readFile ./dotfiles/.zshrc;
  };

  # Tmux configuration
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
    extraConfig = builtins.readFile ./dotfiles/.tmux.conf;
  };

  # Nvim configuration
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      gruvbox
      vim-fugitive
      polyglot
      nerdtree
    ];
    extraConfig = builtins.readFile ./dotfiles/.config/nvim/init.vim;
  };

  home.file = with config.lib.file; {
    ".local/share/color-schemes".source = mkOutOfStoreSymlink ./dotfiles/.local/share/color-schemes;
    ".local/share/konsole".source       = mkOutOfStoreSymlink ./dotfiles/.local/share/konsole;
    ".config/konsolerc".source          = mkOutOfStoreSymlink ./dotfiles/.config/konsolerc;
    ".config/kwinrulesrc".source        = mkOutOfStoreSymlink ./dotfiles/.config/kwinrulesrc;
    ".gitconfig".source                 = mkOutOfStoreSymlink ./dotfiles/.gitconfig;
    ".config/nixpkgs/config.nix".source = ../../pkgs/config.nix;
  };
}