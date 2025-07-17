#!/bin/bash

opt=()

opt+=("Combinatorics")
opt+=("Graph Theory")
opt+=("Calculus")
opt+=("Linear Algebra")
opt+=("Guides")
opt+=("Notes")
opt+=("Drawing")
opt+=("Reading")
opt+=("General Mathematics")
opt+=("All")

ch=$(printf "%s\n" "${opt[@]}" | wofi --cache-file=/dev/null --show dmenu -i)

case "$ch" in
    "Combinatorics")
        dir="$HOME/documents/academic/im/semestre_1/fundamentos_de_combinatoria/"
    ;;
    "Graph Theory")
        dir="$HOME/documents/academic/im/semestre_1/teoria_de_las_graficas/"
    ;;
    "Calculus")
        dir="$HOME/documents/academic/im/guias/bib/calculo/"
    ;;
    "Linear Algebra")
        dir="$HOME/documents/academic/im/guias/bib/algebra_lineal/"
    ;;
    "Guides")
        dir="$HOME/documents/academic/im/guias/guias/"
    ;;
    "Notes")
        dir="$HOME/notes/current-notes/bib"
    ;;
    "Drawing")
        dir="$HOME/documents/books/manuals/drawing"
    ;;
    "Reading")
        dir="$HOME/documents/reading/"
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
