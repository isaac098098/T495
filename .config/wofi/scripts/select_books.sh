#!/bin/bash

opt=()

opt+=("Algebraic Topology")
opt+=("Complex Variables")
opt+=("Notes")
opt+=("Drawing")
opt+=("Tesis")
opt+=("Analysis")
opt+=("Algebra")
opt+=("General Mathematics")
opt+=("All")

ch=$(printf "%s\n" "${opt[@]}" | wofi --cache-file=/dev/null --show dmenu -i)

case "$ch" in
    "Algebraic Topology")
        dir="$HOME/documents/academic/cinvestav/semestre_1/topologia/"
    ;;
    "Complex Variables")
        dir="$HOME/documents/academic/cinvestav/semestre_1/variable_compleja/"
    ;;
    "Notes")
        dir="$HOME/notes/current-notes/bib"
    ;;
    "Drawing")
        dir="$HOME/documents/books/manuals/drawing"
    ;;
    "Tesis")
        dir="$HOME/documents/academic/esfm/tesis/tesis_bib"
    ;;
    "Analysis")
        dir="$HOME/documents/academic/cinvestav/semestre_1/aux_bib/analysis/"
    ;;
    "Algebra")
        dir="$HOME/documents/academic/cinvestav/semestre_1/aux_bib/algebra/"
    ;;
    "General Mathematics")
        dir="$HOME/documents/books/sciences/math"
    ;;
    "All")
        dir="$HOME/documents/books/"
    ;;
esac

sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/wofi/scripts/search_books.sh

exit 0
