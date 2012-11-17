require 'rubygems'
require 'fileutils'
require 'fairytale/helpers'

module Fairytale
  include Fairytale::Helpers

  def path
    File.expand_path "./"
  end

  def get url, layout = :"views/layout.erb", &block
    @url = url

    print "Building #{url} ... "
    view_content = block.call

    unless layout.nil?
      view_content = tilt(layout) { view_content }
    end

    save url, view_content
    print "saved"

    reset
    puts
  end

  # Present merely to mirror Sinatra
  def before &block
    block.call
  end

  protected
    def save url, content
      path = "public#{url}"
      path += "index.html" if url[-1] == '/'
      FileUtils.mkdir_p File.dirname path
      File.open(path, "w+") { |f| f.write content }
    end

    # Resets this object, ready for the next 'request'
    def reset
      instance_variables.each { |var_symbol| instance_variable_set var_symbol, nil }
    end
end

include Fairytale
