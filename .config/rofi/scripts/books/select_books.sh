#!/bin/bash

# select books directory

if [[ "$1" ]]
then
    case "$1" in
        "Combinatorics")
            dir="$HOME/documents/academic/im/semestre_1/combinatorics/bib/"
        ;;
        "Complex Analysis")
            dir="$HOME/documents/academic/im/semestre_1/complex_analysis/bib/"
        ;;
        "Graph Theory")
            dir="$HOME/documents/academic/im/semestre_1/graph_theory/bib/"
        ;;
        "Number Theory")
            dir="$HOME/documents/academic/im/semestre_1/number_theory/bib/"
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
        "OpenGL")
            dir="$HOME/notes/cybersecurity/bib/graphics/opengl"
        ;;
        "Vulkan")
            dir="$HOME/notes/cybersecurity/bib/graphics/vulkan"
        ;;
        "Graphics")
            dir="$HOME/notes/cybersecurity/bib/graphics/theory"
        ;;
        "C")
            dir="$HOME/notes/cybersecurity/bib/languages/c"
        ;;
        "C++")
            dir="$HOME/notes/cybersecurity/bib/languages/cpp"
        ;;
        "Python")
            dir="$HOME/notes/cybersecurity/bib/languages/python"
        ;;
        "Algorithms")
            dir="$HOME/notes/cybersecurity/bib/languages/algorithms"
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
        "Learning")
            dir="$HOME/documents/books/learning/"
        ;;
    esac

    sed -i "3s|.*|dir=\"$dir\"|" $HOME/.config/rofi/scripts/books/open_book.sh

    exit 0
else
    echo "Combinatorics"
    echo "Complex Analysis"
    echo "Graph Theory"
    echo "Number Theory"
    echo "Algebraic Topology"
    echo "Abstract Algebra"
    echo "Category Theory"
    echo "OpenGL"
    echo "Vulkan"
    echo "Graphics"
    echo "C"
    echo "C++"
    echo "Python"
    echo "Algorithms"
    echo "Networking"
    echo "OS"
    echo "Reverse Engineering"
    echo "Pentesting"
    echo "Learning"
    
    exit 0
fi
