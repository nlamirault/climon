Climon
======

[![Build Status](https://travis-ci.org/nlamirault/climon.png)](https://travis-ci.org/nlamirault/climon)


This is the classic [Simon](http://en.wikipedia.org/wiki/Simon_(game)) game in Common Lisp.

## Required softwares

You will need :

* [ASDF](http://www.cliki.net/asdf)
* [PAL](http://common-lisp.net/project/pal)

## Installation

In /usr/share/common-lisp/systems, create a symbolic link
to the system definition file (climon.asd) or
add the ernestine directory to *central-directory* of ASDF :

    CL-USER> (push "/directory/climon/" asdf:*central-registry*)
    CL-USER> (asdf:operate 'asdf:load-op 'climon)

## Launch game

    CL-USER> (climon:climon)


## Screenshots

![0.1](www/climon-0.1.png)


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>
