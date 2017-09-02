#!/bin/sh
sed "s|{env:HOME}|$HOME|" kernel.json > ~/.local/share/jupyter/kernels/guile-scheme/kernel.json
cp src/load.scm ~/.local/share/jupyter/kernels/guile-scheme
cp -r src/guile-jupyter ~/.local/share/jupyter/kernels/guile-scheme
