{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = [
        (pkgs.rWrapper.override { 
            packages = with pkgs.rPackages; [
                wordcloud
                stopwords
                tm
                slam
            ]; 
        })
    ];
}
