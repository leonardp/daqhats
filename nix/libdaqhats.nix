{
  stdenv,
  libgpiod_1,
  ...
}:
let
  x = {};
in
stdenv.mkDerivation rec {
    name = "libdaqhats"; # Probably put a more meaningful name here
    buildInputs = [ libgpiod_1 ];
    src = [ ../. ];
    #sourceRoot = [ ../. ];

    buildPhase = ''
      make -C lib/ all
    '';

    installPhase = ''
      mkdir -p "$out/"
      cp lib/build/libdaqhats.so.1.5.0.0 $out/libdaqhats.so.1
    '';
}
