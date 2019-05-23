# Understanding rumination as a form of inner speech: probing the role of motor processes

An online (and a PDF) version of the thesis is available there: https://www.barelysignificant.com/phd_thesis/

## Abstract

...

## Technical notes

My dissertation is a book based on R Markdown and **bookdown**
(<https://github.com/rstudio/bookdown>, <https://bookdown.org/>). This bookdown project was originally a fork of the demo book
(<https://github.com/rstudio/bookdown-demo>) and is largely inspired by Tristan Mahr's own dissertation: <https://github.com/tjmahr/dissertation/blob/master/README.md>.

Some things I have changed from previous versions of the template.

* I deactivated the default TOC from bookdown and defined a custom one in `00-toc.Rmd` to be able to define the order of the `00-*.Rmd` files (e.g., abstract, preface, etc.).

* I deactivated the default references manager (i.e., natbib or biblatex) to be able to provide a .csl file for the references (`citation_package` in `_output.yml` needs to be `none`). See the `pandoc_args` in the `_output.yml` file.
