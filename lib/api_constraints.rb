class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || authenticity_check(req)
  end

  protected
  def authenticity_check(req)
    req.headers['Accept'].include?("application/vnd.bookmarks_rss.v#{@version}}")
  end


end
