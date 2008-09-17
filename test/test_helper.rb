require 'test/unit'
require File.dirname(__FILE__) + '/../lib/sparkleology'

gem 'Shoulda'
require "Shoulda"

ENV['TEST_HOME'] = File.dirname(__FILE__) + "/fixtures"

class Test::Unit::TestCase
  def self.should_return_plist_path
    should "return plist path" do
      expected = File.join(ENV['TEST_HOME'], 'Applications', "#{app_name}.app", 'Contents', 'Info.plist')
      assert_equal(expected, @command.plist_path)
    end
  end
end