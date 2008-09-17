$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Sparkleology
end

# core libs
require "open-uri"
require "tempfile"

# external gems
require "rubygems"
gem 'plist'
require 'plist'
gem 'libxml-ruby'
require "xml"

require "sparkleology/exceptions"
require "sparkleology/find_application_command"
require 'sparkleology/latest_version_command'
