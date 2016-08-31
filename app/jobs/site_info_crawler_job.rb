SiteInfoCrawlerJob = Struct.new(:user, :options) do
  def perform
    SiteInfo.crawler_build_articles(user, options)
  end
end