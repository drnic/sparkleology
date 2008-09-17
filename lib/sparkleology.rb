$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Sparkleology
end

# external gems
require "rubygems"
gem 'plist'
require 'plist'
gem 'libxml-ruby'
require "libxml"

require "sparkleology/command"