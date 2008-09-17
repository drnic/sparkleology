require File.dirname(__FILE__) + "/test_helper"

class TestFindApplicationCommand < Test::Unit::TestCase
  attr_reader :app_name
  
  context "for app name with a sparkle RSS feed" do
    setup do
      @command = Sparkleology::FindApplicationCommand.new(@app_name = 'ValidSparkleApp')
    end

    should_return_plist_path
    
    should "find sparkle feed URL for latest versions of application" do
      expected = "http://update.plasq.com/skitch-appcast.xml"
      assert_equal(expected, @command.url_for_latest_versions)
    end
  end
  
  context "for app name without sparkle RSS feed" do
    setup do
      @command = Sparkleology::FindApplicationCommand.new(@app_name = 'NonSparkleApp')
    end

    should_return_plist_path
    
    should "not find sparkle URL and raise exception" do
      assert_raise(Sparkleology::NonSparkleApplicationException) { @command.url_for_latest_versions }
    end
  end

  context "for invalid app name" do
    setup do
      @command = Sparkleology::FindApplicationCommand.new(@app_name = 'XXX')
    end

    should "not find a plist file and raise exception" do
      assert_raise(Sparkleology::InvalidApplicationNameException) { @command.plist_path }
    end
  end
  
end
