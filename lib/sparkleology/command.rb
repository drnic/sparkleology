class Sparkleology::Command
  def self.for(app_name_or_feed_url)
    feed_url?(app_name_or_feed_url) ?
      Sparkleology::LatestVersionCommand.new(app_name_or_feed_url) :
      Sparkleology::FindApplicationCommand.new(app_name_or_feed_url)
  end
  
  def self.feed_url?(app_name_or_feed_url)
    app_name_or_feed_url =~ /:/
  end
end