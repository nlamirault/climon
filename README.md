Climon
======

[![License MIT][badge-license]][LICENSE]

Master :
* [![Circle CI](https://circleci.com/gh/nlamirault/climon/tree/master.svg?style=svg)](https://circleci.com/gh/nlamirault/climon/tree/master)

Develop:
* [![Circle CI](https://circleci.com/gh/nlamirault/climon/tree/develop.svg?style=svg)](https://circleci.com/gh/nlamirault/climon/tree/develop)

This is the classic [Simon](http://en.wikipedia.org/wiki/Simon_(game)) game in Common Lisp.

## Required softwares

You will need :

* [SBCL](http://www.sbcl.org)
* [Quicklisp](http://www.quicklisp.org)

and dependencies :

    $ sudo apt-get install libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev

## Installation

* Install tools and dependencies :

        $ make init
        $ make deps

* Make binary :

        $ make binary

* Launch game :

        $ roswell/climon


## Commands

Available commands :

* space : Start a new game
* mouse : click to the specific color
* g : choose GREEN
* b : choose BLUE
* y : choose YELLOW
* r : choose RED


## Screenshots

![0.1](www/climon-0.1.png)



## Development

* Install [roswell][] to setup the Common Lisp environment and install your Common Lisp implementation using it.:

        $ make init
        $ ros install sbcl

* Install dependencies :

        $ make deps

* Launch unit tests :

        $ make test


## Support / Contribute

See [here](CONTRIBUTING.md)



## Changelog

A changelog is available [here](ChangeLog.md).


## License

See [LICENSE](LICENSE).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[climon]: https://github.com/nlamirault/climon
[badge-license]: https://img.shields.io/badge/license-MIT-green.svg?style=flat
[LICENSE]: https://github.com/nlamirault/climon/blob/master/LICENSE

[Issue tracker]: https://github.com/nlamirault/climon/issues
