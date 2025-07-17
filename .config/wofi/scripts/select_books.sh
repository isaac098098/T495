#!/bin/bash

opt=()

opt+=("Networking")
opt+=("OS")
opt+=("Reverse Engineering")
opt+=("Pentesting")
opt+=("Languages")
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
    "Networking")
        dir="$HOME/notes/cybersecurity/bib/networking"
    ;;
    "OS")
        dir="$HOME/notes/cybersecurity/bib/os"
    ;;
    "Reverse Engineering")
        dir="$HOME/notes/cybersecurity/bib/reversing"
    ;;
    "Pentesting")
        dir="$HOME/notes/cybersecurity/bib/pentesting"
    ;;
    "Languages")
        dir="$HOME/notes/cybersecurity/bib/formal"
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
