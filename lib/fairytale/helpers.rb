require 'rubygems'
require 'erb'
require 'tilt'
require 'digest/sha1'

module Fairytale
  module Helpers
    def md file, params = {}, &block
      file = "content/#{file.to_s}" if file.class == Symbol
      tilt(file, params, &block)
    end
  
    def erb file, params = {}, &block
      file = "views/#{file.to_s}.erb" if file.class == Symbol
      tilt(file, params, &block)
    end
  
    def sass file, params = {}, &block
      file = "public/assets/css/#{file.to_s}.sass" if file.class == Symbol
      tilt(file, params, &block)
    end
  
    def scss file, params = {}, &block
      file = "public/assets/css/#{file.to_s}.scss" if file.class == Symbol
      tilt(file, params, &block)
    end
  
    def tilt file, engine_options = {}, &block
      engine_options ||= {}
      template = Tilt.new file.to_s, nil, engine_options
      template.render(self) { block.call }
    end
  
    def md5 file
      Digest::SHA1.hexdigest File.read(file)
    end
  end
end