require 'feed_crawler'
require 'uri'

class SiteInfo < ApplicationRecord

  attr_accessor :user

  has_and_belongs_to_many :users
  has_many :site_infos_users
  has_many :articles, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :url, :title, presence: true
  validates :url, uniqueness: true

  after_commit :create_site_infos_user, on: :create

  def favicon_url
    uri = URI.parse(url)
    "#{uri.scheme}://#{uri.hostname}/favicon.ico"
  end  

  private

  def create_site_infos_user
    user.site_infos_users.find_or_create_by(site_info: self) if user
  end

  class << self
    def enqueue_bookmark(user, options = {})
      Delayed::Job.enqueue SiteInfoCrawlerJob.new(user, options)
    end

    def crawler_build_articles(user, options = {})
      site_info = crawler_articles(user, options[:url])
      user.bookmarks.find_or_create(options.merge(site_info: site_info)) if site_info
    end

    def crawler_articles(user, url)
      return if url.blank? || !url =~ URI::regexp(['http', 'https'])
      res = crawler_feed(FeedCrawler.fetch(url))
      if res.present?
        site_info = SiteInfo.find_or_initialize_by(url: res[:url])
        site_info.title = res[:title]
        site_info.user = user
        site_info.save!

        res[:items].map do |art|
          Rails.logger.info("url: #{site_info.url}, article: #{art}")
          article = Article.find_or_initialize_by(link: art[:link], site_info: site_info)
          article.assign_attributes(art.slice(:title, :link, :published, :author, :description, :content, :guid))
          article.save!
        end
        site_info
      end
    end

    def crawler_feed(rss_url)
      begin
        return FeedParser.new(url: rss_url).parse.as_json if rss_url.present?
      rescue Exception => e
        Rails.logger.error("url: #{rss_url}, error: #{e.message}")
      end; {}
    end
  end
end
