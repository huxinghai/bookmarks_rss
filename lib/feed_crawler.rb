require 'nokogiri'
require 'open-uri'

class FeedCrawler
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def search
    doc = Nokogiri::HTML(open(@url))
    item = doc.css("link[type='application/rss+xml']")[0]
    return item.attributes["href"].value if item.present?
  end


  class << self

    def fetch(url)
      @instance = self.new(url)
      @instance.search
    end

  end
end