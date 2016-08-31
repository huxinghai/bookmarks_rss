class SiteInfo < ApplicationRecord

  belongs_to :user
  has_many :articles

  validates :user, presence: true

  class << self
    def crawler_articles(url)
      return if url.blank? || url =~ URI::regexp(['http', 'https'])
      res = crawler_feed(FeedCrawler.fetch(options[:url]))
      if res.present?
        site_info = self.find_or_initialize_by(url: res[:url])
        site_info.title = res[:title]
        site_info.save!
        res[:items].map do |article|
          Rails.logger.info("url: #{site_info.url}, article: #{article}")
          article = site_info.articles.find_or_initialize_by(title: article[:title])
          article.assign_attributes(article.slice(:link, :published, :author, :description, :content, :guid))
          article.save!
          article
        end
      end
    end

    def crawler_feed(rss_url)
      begin
        rss_url.present? ? FeedParser.new(url: rss_url).parse.as_json : {}
      rescue Exception => e
        Rails.logger.error("url: #{rss_url}, error: #{e.message}")
        {}
      end
    end
  end
end
