{ appimageTools, fetchurl }:
let
  pname = "capacities";
  version = "1.54.17";
  src = fetchurl {
    url = "https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-1.54.17.AppImage";
    sha256 = "sha256-5A+LrTX1pMSxJXX/I7gQGyZvZhf4Qb5M0sZnEcuP2EQ=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
  appimageTools.wrapType2
{
  inherit pname version src;
  extraInstallCommands = '' 
    install -m 444 -D ${appimageContents}/capacities.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/capacities.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}'
    install -m 444 -D ${appimageContents}/capacities.desktop \
      $out/share/icons/hicolor/256x256/apps/capacities.png
  '';
}

