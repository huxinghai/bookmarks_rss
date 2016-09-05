# 00 0 * * * /bin/bash -l -c 'cd ~/bookmarks_rss/current && RAILS_ENV=production bundle exec rake rss:crawler --silent >> ~/bookmarks_rss/current/log/rss_crawler.log 2>> ~/bookmarks_rss/current/log/rss_crawler_err.log'

namespace :rss do 

  task :crawler => :environment do 
    @site_infos = SiteInfo.order(last_updated_at: :asc).limit(80)
    @site_infos.each do |s|  
      s.crawler_articles
      s.users.each{|u| u.send_notify }
    end
  end
end