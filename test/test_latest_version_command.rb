require File.dirname(__FILE__) + "/test_helper"

class TestLatestVersionCommand < Test::Unit::TestCase
  attr_reader :feed_url
  
  context "valid RSS feed url" do
    setup do
      @command = Sparkleology::LatestVersionCommand.new(@feed_url = "http://update.plasq.com/skitch-appcast.xml")
      @command.expects(:fetch_feed).returns(sparkle_rss_for_skitch)
    end

    should "find latest version URL" do
      expected = "http://skitch.com/download/skitch-b6.2-v10678.zip"
      assert_equal(expected, @command.run)
    end
    
    should "fetch feed" do
      @command.run
    end
  end
  
  
  def sparkle_rss_for_skitch
    <<-RSS
<?xml version="1.0"?> 
<rss version="2.0" xmlns:sparkle="http://www.andymatuschak.org/xml-namespaces/sparkle"> 
    <channel> 
        <title>Skitch beta 6.2 by plasq</title> 
        <link>http://plasq.com/update/skitch-appcast.xml</link> 
        <description>Most recent changes with links to updates.</description> 
        <language>en</language> 
        <item> 
            <title>Skitch beta 6.2 released!</title> 
            <description>
&lt;p&gt;&lt;b&gt;Note:&lt;/b&gt;&lt;br&gt;
&lt;li&gt;New build to extend Skitch beta&lt;br&gt;
&lt;br&gt;

For version history, visit: &lt;a href="http://plasq.com/skitch/history"&gt; http://plasq.com/skitch/history&lt;/a&gt;

</description>
            <pubDate>Wednesday, 2 July 2008 12:00:00 +0000</pubDate> 
            <enclosure sparkle:version="1.0b6.2 (v1.0a12)" url="http://skitch.com/download/skitch-b6.2-v10678.zip" length="12257817" type="application/octet-stream"/>
        </item> 
    </channel> 
</rss>
    RSS
  end
end