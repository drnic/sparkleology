class Sparkleology::LatestVersionCommand
  attr_reader :rss_feed_url
  
  def initialize(rss_feed_url)
    @rss_feed_url = rss_feed_url
  end
  
  def run
    fetch_feed_in_temp_file
    feed_xml = XML::Document.file(tmp_file_path)
    node = feed_xml.find_first "//rss/channel/item"
    node = node.find_first "enclosure"
    node["url"]
  end
  
  def fetch_feed_in_temp_file
    File.open(tmp_file_path, "w+") do |file|
      file << self.fetch_feed
    end
  end
  
  def fetch_feed
    open(rss_feed_url).read
  end
  
  def tmp_file_path
    File.join(Dir::tmpdir, "sparkleology.rss")
  end
end