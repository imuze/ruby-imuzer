# Imuzer

imuzer is a minimalistic gem that lets you generate music from the online music generation platform imuze.io.

# Pre-requisits

* You will need an account on iMuze in order to use it.
* You will need to install `mpg123` to actually listen the mp3

## Installation

    $ gem install imuzer

## Usage

    [yacin@mac imuzer (master)]$ bundle exec bin/imuzer -h
    NAME
        imuzer - a demo tool for iMuze API

    SYNOPSIS
        imuzer [global options] command [command options] [arguments...]

    GLOBAL OPTIONS
        -e, --email=email       - Email from your iMuze user account (default: none)
        --help                  - Show this message
        -p, --password=password - Password from your iMuze user account (default: none)
        -v, --[no-]verbose      - Be verbose

    COMMANDS
        compose - composes a music
        genres  - list all musical genres and subgenres
        help    - Shows a list of commands or help for one command

### Example 1: list all musical genres

    [yacin@mac imuzer (master)]$ imuzer genres

### Example 2: compose and play music

    [yacin@mac imuzer (master)]$ imuzer -e 'me@example.com' -p 'thispiggywent' compose rock dynamic 30000 'calm:0.2,medium:0.4,dynamic:0.2,calm:0.2'

### Example 3: compose and download music

    [yacin@mac imuzer (master)]$ imuzer -e 'me@example.com' -p 'thispiggywent' compose rock dynamic 30000 'calm:0.2,medium:0.4,dynamic:0.2,calm:0.2' -d

_note_: flag `-d` at the end of the command line

### Example 3: compose and play music with low volume on vocals (-10db)

    [yacin@mac imuzer (master)]$ bundle exec bin/imuzer compose -h
    NAME
        compose - composes a music

    SYNOPSIS
        imuzer [global options] compose [command options] genre subgenre duration structure

    COMMAND OPTIONS
        -c, --[no-]crop               -
        -d, --[no-]download           -
        --fadeout_ms=fadeout_ms       - fadeout in milliseconds (default: none)
        --voices_volume=voices_volume - volume of voice track (default: none)


    [yacin@mac imuzer (master)]$ imuzer -e 'me@example.com' -p 'thispiggywent' compose rock dynamic 30000 'calm:0.2,medium:0.4,dynamic:0.2,calm:0.2' --voices_volume=-10

_note_: flag `--voices_volume=-10 db` at the end of the command line

## Contributing

1. Fork it ( https://github.com/[my-github-username]/imuzer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
