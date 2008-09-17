require File.dirname(__FILE__) + "/test_helper"

class TestCommand < Test::Unit::TestCase
  attr_reader :app_name
  
  context "for app name with a sparkle RSS feed" do
    setup do
      @command  = Sparkleology::Command.new(@app_name = 'ValidSparkleApp')
    end

    should_return_plist_path
  end
  
  context "for app name without sparkle RSS feed" do
    setup do
      @command = Sparkleology::Command.new(@app_name = 'NonSparkleApp')
    end

    should_return_plist_path
  end

  context "for invalid app name" do
    setup do
      @command = Sparkleology::Command.new(@app_name = 'XXX')
    end

    should "not find a plist file" do
      assert_raise(Sparkleology::InvalidApplicationNameException) { @command.plist_path }
    end
  end
  
end
