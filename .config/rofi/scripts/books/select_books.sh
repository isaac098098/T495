#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
        "Combinatorics")
            dir="$HOME/documents/academic/im/semestre_1/combinatorics/bib/"
        ;;
        "Graph Theory")
            dir="$HOME/documents/academic/im/semestre_1/graph_theory/bib/"
        ;;
        "Algebraic Topology")
            dir="$HOME/documents/academic/im/semestre_1/algebraic_topology/bib/"
        ;;
        "Abstract Algebra")
            dir="$HOME/documents/academic/im/semestre_1/abstract_algebra/bib/"
        ;;
        "Category Theory")
            dir="$HOME/documents/academic/im/semestre_1/category_theory/bib/"
        ;;
        "Graphics")
            dir="$HOME/notes/cybersecurity/bib/graphics"
        ;;
        "Languages")
            dir="$HOME/notes/cybersecurity/bib/languages"
        ;;
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
    esac

    sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/rofi/scripts/bash/search/search_book.sh

    exit 0
else
    echo "Combinatorics"
    echo "Graph Theory"
    echo "Algebraic Topology"
    echo "Abstract Algebra"
    echo "Category Theory"
    echo "Graphics"
    echo "Languages"
    echo "Networking"
    echo "OS"
    echo "Reverse Engineering"
    echo "Pentesting"
    
    exit 0
fi
