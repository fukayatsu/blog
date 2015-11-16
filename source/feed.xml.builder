xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = config[:site_url]
  xml.title config[:site_title]
  xml.subtitle config[:site_subtitle]
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name config[:site_author] }

  blog.articles[0..5].each do |article|
    xml.entry do
      url = URI.join(site_url, URI.escape(article.url))
      xml.title article.title
      xml.link "rel" => "alternate", "href" => url
      xml.id url
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name config[:site_author] }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
