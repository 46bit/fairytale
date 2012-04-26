# Fairytale

Fairytale is a Ruby static-site compiler designed to work as closely as possible to the process of building a dynamic site. Building with it is designed to closely resemble building with [Sinatra](http://sinatrarb.com):

    # mysite.rb
    require 'fairytale'
    
    get '/' do
      "Hello world!"
    end

Install the gem and run with:
  
    gem install fairytale
    ruby -rubygems mysite.rb

Compiled files go into the ./webroot directory.

## Credits
Licensed under MIT, created by [Michael Mokrysz](https://46bit.com). A lot of credit has to go to the [Sinatra](http://sinatrarb.com) team.