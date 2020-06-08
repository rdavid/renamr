# Renamr
File and directory names organiser

* [About](#about)
* [Installation](#installation)
* [Usage](#usage)
* [License](#license)

## About
Hi, I'm [David Rabkin](https://www.rabkin.co.il). I created this tool to
orginize multiple files.

## Installation
The tool is designed to work on macOS, GNU/Linux, Windows, Unix-like OS. It is
packaged as a Gem and require Ruby version 2.4 or later.  See «[Installing
Ruby](https://www.ruby-lang.org/en/documentation/installation/)» if you don't
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

### Example

    renamr -d <source>

It renames all files in `source` by default pattern: 26 English letters,
10 numbers, minus for spaces and other symbols.

## License
Renamr is copyright [David Rabkin](http://www.rabkin.co.il/) and
available under a [2-Claus BSD license](https://github.com/rdavid/renamr/blob/master/LICENSE).
