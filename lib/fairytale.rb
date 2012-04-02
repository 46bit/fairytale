require 'rubygems'
require 'stringio'
require 'fileutils'
require 'erb'
require 'tilt'
require 'digest/sha1'

module Fairytale
  def get url, layout = :"views/layout.erb", &block
    print "Building #{url} ... "
    view_content = block.call
    view_content = tilt(layout, url: url) { view_content } unless layout.nil?
    
    save url, view_content
    print "saved"
    
    reset!
    puts
  end
  
  def save url, content
    path = "webroot#{url}"
    path += "index.html" if url[-1] == '/'
    FileUtils.mkdir_p File.dirname path
    File.open(path, "w+") { |f| f.write content }
  end
  
  def reset!
    instance_variables.each { |var_symbol| instance_variable_set var_symbol, nil }
  end
  
  def md file, params = {}, &block
    file = "content/#{file.to_s}" if file.class == Symbol
    tilt(file, params, &block)
  end
  
  def erb file, params = {}, &block
    file = "views/#{file.to_s}.erb" if file.class == Symbol
    tilt(file, params, &block)
  end
  
  def sass file, params = {}, &block
    file = "webroot/assets/css/#{file.to_s}.sass" if file.class == Symbol
    tilt(file, params, &block)
  end
  
  def scss file, params = {}, &block
    file = "webroot/assets/css/#{file.to_s}.scss" if file.class == Symbol
    tilt(file, params, &block)
  end
  
  def tilt file, params = {}, &block
    engine_options = params[:engine_options] || {}
    template = Tilt.new file.to_s, nil, engine_options
    template.render(self, params) { block.call }
  end
  
  def digest file
    Digest::SHA1.hexdigest File.read(file)
  end
end

include Fairytale