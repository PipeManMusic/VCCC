# Music Theory Book Project

This repository contains the source files for "A Reproducible Music Theory Guide," an open-source textbook.

## Overview

This project uses Pandoc Markdown for text, LilyPond for musical scores, and a `Makefile` to build both print-ready PDF and reflowable EPUB3 files from a single set of source files.

-   **Text Source**: `chapters/*.md`
-   **Score Source**: `scores/*.ly`
-   **Build Tool**: `make`
-   **Compiler**: `pandoc`
-   **PDF Engine**: `xelatex`

## Dependencies

To build this project, you will need the following software installed:

-   **GNU Make**: The build automation tool.
-   **Pandoc**: The universal document converter.
-   **LilyPond**: The music engraving program.
-   **A TeX Live distribution**: Specifically, `xelatex` and the `texlive-xetex` package.
    -   You may also need to install fonts, such as `texlive-fonts-recommended` and the `libertine` package for the default template.

### Installation (Debian/Ubuntu)

```bash
sudo apt-get update
sudo apt-get install make pandoc lilypond texlive-xetex texlive-fonts-recommended texlive-latex-extra
```

## Usage

The build process is managed by the `Makefile`. Here are the main commands:

-   **`make all`**
    Builds both the EPUB and PDF versions of the book. This is the recommended command for a full build.

-   **`make pdf`**
    Generates a print-ready PDF file located at `build/book.pdf`.

-   **`make epub`**
    Generates a reflowable EPUB3 file located at `build/book.epub`.

-   **`make scores`**
    Compiles all LilyPond files (`.ly`) into cropped PDF and SVG images in the `build/scores/` directory. This is useful for debugging scores individually.

-   **`make clean`**
    Removes all generated files from the `build/` directory and other temporary files.

## How to Contribute

1.  Fork the repository.
2.  Create a new branch for your changes (`git checkout -b feature/your-feature`).
3.  Make your changes to the Markdown or LilyPond files.
4.  Build the book (`make all`) to ensure everything still compiles correctly.
5.  Commit your changes and open a pull request.
