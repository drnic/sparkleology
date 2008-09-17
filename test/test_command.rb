require File.dirname(__FILE__) + "/test_helper"

class TestCommand < Test::Unit::TestCase
  context "with app name" do
    setup do
      @command = Sparkleology::Command.for('ValidSparkleApp')
    end

    should "be FindApplicationCommand" do
      assert_instance_of(Sparkleology::FindApplicationCommand, @command)
    end
    
    should "have app_name" do
      assert_equal('ValidSparkleApp', @command.app_name)
    end
  end

  context "with some URL" do
    setup do
      @command = Sparkleology::Command.for('http://someurl.com')
    end

    should "be LatestVersionCommand" do
      assert_instance_of(Sparkleology::LatestVersionCommand, @command)
    end
    
    should "have feed_url" do
      assert_equal('http://someurl.com', @command.rss_feed_url)
    end
  end
  
end