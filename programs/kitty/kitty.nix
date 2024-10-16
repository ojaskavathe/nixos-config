{ pkgs, ... }:
{
  nixpkgs = {
    overlays = [
      # change icon
      (final: prev: {
        kitty = prev.kitty.overrideAttrs (oldAttrs: {
          postInstall = (oldAttrs.postInstall or "") + ''
              cp -f ${./kitty.app.png} $out/share/icons/hicolor/256x256/apps/kitty.png
              rm -f $out/share/icons/hicolor/scalable/apps/kitty.svg
          '';
        });
      })

    ];
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNL Nerd Font";
    };
    themeFile = "Catppuccin-Mocha";
  };
}
