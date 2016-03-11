# Imuzer

imuzer is a minimalistic gem that lets you generate music from the online music generation platform imuze.io.

# Pre-requisits

* You will need an account on iMuze in order to use it.
* You will need to install `mpg123` to actually listen the mp3

## Installation

    $ gem install imuzer

## Usage

    [yacin@mac imuzer (master)]$ imuzer -h

    Usage: imuzer [options] duration genre subgenre structure

    Composes a track with iMuze

    v0.0.1

    Options:
        -h, --help                       Show command line help
        -e, --email email                your imuze account email
        -p, --password password          your imuze password
        -v, --verbose                    Be verbose
            --version                    Show help/version info
            --log-level LEVEL            Set the logging level
                                         (debug|info|warn|error|fatal)
                                         (Default: info)

    Arguments:

        duration
            Track duration
        genre
            Track genre
        subgenre
            Track subgenre
        structure
            Track structure

Bellow is an example on how to use the tool:

    [yacin@mac imuzer (master)]$ imuzer -v -e MYEMAIL -p MYPASSWORD 30000 edm soft 'calm:0.3,medium:0.3,dynamic:0.3'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/imuzer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
