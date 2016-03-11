# Imuzer

imuzer is a minimalistic gem that lets you generate music from the online music generation platform imuze.io.
You will need an account on iMuze in order to use it.

## Installation

    $ gem install imuzer

## Usage

    imuzer --help
    Usage: imuzer [options] email password duration genre subgenre structure

    Composes a track with iMuze

    v0.0.1

    Options:
        -h, --help                       Show command line help
            --version                    Show help/version info
            --log-level LEVEL            Set the logging level
                                     (debug|info|warn|error|fatal)
                                     (Default: info)

    Arguments:

        email
            Account email
        password
            Account password
        duration
            Track duration
        genre
            Track genre
        subgenre
            Track subgenre
        structure
            Track structure
        
    Bellow is an example on how to use the tool:    

    imuzer me@example my_password 55000 edm soft 'medium:0.1,calm:0.75,medium:0.15'

## Contributing

1. Fork it ( https://github.com/[my-github-username]/imuzer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
