# Renamr [![build](https://travis-ci.org/rdavid/renamr.svg)](https://travis-ci.org/rdavid/renamr) [![build](https://ci.appveyor.com/api/projects/status/cca9iog230smu3k2?svg=true)](https://ci.appveyor.com/project/rdavid/renamr) [![rubocop](https://github.com/rdavid/renamr/actions/workflows/rubocop.yml/badge.svg)](https://github.com/rdavid/renamr/actions/workflows/rubocop.yml) [![gem](https://badge.fury.io/rb/renamr.svg)](https://badge.fury.io/rb/renamr) [![maintainability](https://api.codeclimate.com/v1/badges/406f1433b0b9e0509a6e/maintainability)](https://codeclimate.com/github/rdavid/renamr/maintainability) [![hits of code](https://hitsofcode.com/github/rdavid/renamr?branch=master&label=hits%20of%20code)](https://hitsofcode.com/view/github/rdavid/renamr) [![ruby style](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) [![license](https://img.shields.io/github/license/rdavid/renamr?color=blue&labelColor=gray&logo=freebsd&logoColor=lightgray&style=flat)](https://github.com/rdavid/renamr/blob/master/LICENSE)
File and directory names organizer.

* [About](#about)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

## About
Hi, I'm [David Rabkin](http://cv.rabkin.co.il). I created this tool to
orginize multiple files.

## Installation
The tool is designed to work on macOS, GNU/Linux, Windows, Unix-like OS. It is
packaged as a Gem and require Ruby version 2.6 or later. See “[Installing
Ruby](https://www.ruby-lang.org/en/documentation/installation/)” if you don't
have the proper version on your platform.

Use this command to install:
```sh
gem install renamr
```
### Updating
Use this command to update the package:
```sh
gem update renamr
```
### Requirements
There are no requirements.

## Usage
```sh
renamr [options]
	-a, --act                        Real renaming.
	-r, --rec                        Passes recursively.
	-l, --lim                        Limits name length.
	-m, --mod                        Prepends modification time.
	-d, --dir dir                    Directory to rename.
	-s, --src src                    A string to substitute.
	-t, --dst dst                    A string to replace to.
	-w, --wid wid                    Width of the table.
	-p, --pre str,beg                A string to prepend to started from beg.
	-c, --cut pos,len                Removes len symbols from pos.
	-v, --version                    Shows version.
```
### Example
```sh
renamr -d <source>
```
It renames all files in `source` by default pattern: 26 English letters,
10 numbers, minus for spaces and other symbols.

## License
`renamr` is copyright [David Rabkin](http://cv.rabkin.co.il) and
available under a [Zero-Clause BSD license](https://github.com/rdavid/renamr/blob/master/LICENSE).
