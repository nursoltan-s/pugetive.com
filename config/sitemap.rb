# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://toddgehman.com"



SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add root_path

  Interest::INTEREST_IDS.each do |interest_id|
    interest = Interest.find(interest_id)
    add interest_path(interest)
    work_class = interest.work_name.safe_constantize
    work_class.all.each do |work|
      add self.send("#{interest.work_name.downcase}_path", work), lastmod: work.updated_at
    end

  end

  Tool.all.each do |tool|
    add tool_path(tool)
  end

  Genre.all.each do |genre|
    add genre_path(genre)
  end

  Title.all.each do |title|
    add title_path(title)
  end



  # add programs_path
  # add about_path
  # add terms_path
  # add groups_path
  # Program.find(Program::DISPLAYED_PROGRAM_IDS).each do |program|
  #   next unless program.published?
  #   add program_path(program), :lastmod => program.updated_at
  # end

  # Key.all.each do |key|
  #   add '/', host: "#{CONFIG[Rails.env][:host_protocol]}://#{key.canonical_domain}", :lastmod => key.keyable.updated_at
  # end
  # Post.published.each do |post|
  #   add post_path(post)
  # end
end
