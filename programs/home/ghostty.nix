{ pkgs, ... }:
let
  crtShaderSrc = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/luiscarlospando/crt-shader-with-chromatic-aberration-glow-scanlines-dot-matrix/main/crt-shader-with-chromatic-aberration-glow-scanlines-dot-matrix.glsl";
    sha256 = "sha256-Z+iEnFocnDfxQzHFPmS+hEl2aN4LUt1dRtx3B36EmR4=";
  };

  # Patch the upstream shader: stronger glow, de-aliased scanlines for high-DPI displays
  crtShader = pkgs.runCommand "crt-glow-tuned.glsl" { } ''
    cp ${crtShaderSrc} $out
    sed -i \
      -e 's/DIM_CUTOFF = 0.28/DIM_CUTOFF = 0.22/' \
      -e 's/BRIGHT_BOOST = 1.0/BRIGHT_BOOST = 1.25/' \
      -e 's/DIM_GLOW = 0.05/DIM_GLOW = 0.12/' \
      -e 's/BRIGHT_GLOW = 0.10/BRIGHT_GLOW = 0.22/' \
      -e 's/COLOR_GLOW = 0.3/COLOR_GLOW = 0.45/' \
      -e 's/sin(fragCoord\.y)/sin(fragCoord.y * 0.5)/' \
      $out
  '';
in
{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      custom-shader = "${crtShader}";
      custom-shader-animation = true;

      background-opacity = 0.92;
      unfocused-split-opacity = 0.85;
    };
  };
}
