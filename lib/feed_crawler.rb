require 'nokogiri'
require 'open-uri'

class FeedCrawler
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def search
    begin
      doc = Nokogiri::HTML(open(@url))
      item = doc.css("link[type='application/rss+xml']")[0]
      if item.present?
        href = item.attributes["href"].value
        return href if href =~ URI::regexp(['http', 'https'])
      end
    rescue Exception => e
      Rails.logger.error("search url #{@url} error: #{e.message}")
    end; nil
  end

  class << self

    def fetch(url)
      if url =~ URI::regexp
        @instance = self.new(url)
        @instance.search
      end
    end

  end
end