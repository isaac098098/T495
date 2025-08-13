#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
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
            dir="$HOME/notes/cybersecurity/bib/languages"
        ;;
        "Graphics")
            dir="$HOME/notes/cybersecurity/bib/graphics"
        ;;
        "Calculus")
            dir="$HOME/documents/academic/im/guias/bib/calculo"
        ;;
        "Linear Algebra")
            dir="$HOME/documents/academic/im/guias/bib/algebra_lineal"
        ;;
        "Guides")
            dir="$HOME/documents/academic/im/guias/guias/"
        ;;
        "Notes")
            dir="$HOME/notes/current-notes/bib/"
        ;;
    esac

    sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/rofi/scripts/search_book.sh

    exit 0
else
    echo "Networking"
    echo "OS"
    echo "Reverse Engineering"
    echo "Pentesting"
    echo "Languages"
    echo "Graphics"
    echo "Calculus"
    echo "Linear Algebra"
    echo "Guides"
    echo "Notes"
    
    exit 0
fi
