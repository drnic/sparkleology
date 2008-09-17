# This command class takes an OS X application name, such as 'Skitch',
# and returns the Sparkle RSS feed URL containing the latest update
# information.
# Pass the application name to the initializer, and call +run+.
#   +Sparkleology::FindApplicationCommand.new('Skitch').run+
class Sparkleology::FindApplicationCommand
  attr_reader :app_name

  def initialize(app_name)
    @app_name = app_name
  end
  
  def run
    url_for_latest_versions
  end
  
  def plist_path
    @plist_path ||= begin
      full_app_name = app_name.gsub(/\.app$/,'') + ".app"
      self.paths.
           map { |root_path| File.join(root_path, full_app_name, "Contents/Info.plist") }.
           find { |plist| File.exists?(plist) }
    end || begin
      raise Sparkleology::InvalidApplicationNameException, app_name
    end
  end
  
  def url_for_latest_versions
    application_info = Plist::parse_xml(plist_path)
    application_info['SUFeedURL'] || begin
      raise Sparkleology::NonSparkleApplicationException, app_name
    end
  end
  
  def paths
    ["#{home_path}/Applications", "/Applications"]
  end
  
  def home_path
    ENV['TEST_HOME'] || ENV['HOME'] || File.expand_path('~')
  end
end