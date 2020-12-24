# Renamr
File and directory names organiser.

[![Build
Status](https://travis-ci.org/rdavid/renamr.svg)](https://travis-ci.org/rdavid/renamr)
[![Build
status](https://ci.appveyor.com/api/projects/status/cca9iog230smu3k2?svg=true)](https://ci.appveyor.com/project/rdavid/renamr)
[![Gem
Version](https://badge.fury.io/rb/renamr.svg)](https://badge.fury.io/rb/renamr)
[![Maintainability](https://api.codeclimate.com/v1/badges/406f1433b0b9e0509a6e/maintainability)](https://codeclimate.com/github/rdavid/renamr/maintainability)

[![Hits-of-Code](https://hitsofcode.com/github/rdavid/renamr)](https://hitsofcode.com/view/github/rdavid/renamr)
[![License](https://img.shields.io/badge/license-0BSD-green)](https://github.com/rdavid/renamr/blob/master/LICENSE)


* [About](#about)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

## About
Hi, I'm [David Rabkin](http://davi.drabk.in). I created this tool to
orginize multiple files.

## Installation
The tool is designed to work on macOS, GNU/Linux, Windows, Unix-like OS. It is
packaged as a Gem and require Ruby version 2.6 or later.  See “[Installing
Ruby](https://www.ruby-lang.org/en/documentation/installation/)” if you don't
have the proper version on your platform.

Use this command to install:

    gem install renamr

### Updating
Use this command to update the package:

    gem update renamr

### Requirements
There are no requirements.

## Usage
    renamr [options]
      -a, --act                        Real renaming.
      -r, --rec                        Passes recursively.
      -l, --lim                        Limits name length.
      -m, --mod                        Prepends modification time.
      -d, --dir dir                    Directory to rename.
      -s, --src src                    A string to substitute.
      -t, --dst dst                    A string to replace to.
      -p, --pre pre                    A string to prepend to.
      -w, --wid wid                    Width of the table.
      -c, --cut pos,len                Removes symbols from pos.
      -v, --version                    Shows version.

### Example

    renamr -d <source>

It renames all files in `source` by default pattern: 26 English letters,
10 numbers, minus for spaces and other symbols.

## License
Renamr is copyright [David Rabkin](http://davi.drabk.in) and
available under a [Zero-Clause BSD license](https://github.com/rdavid/renamr/blob/master/LICENSE).
