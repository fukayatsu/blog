require 'rouge'
require 'rouge/plugins/redcarpet'
require 'linguist'

class HtmlWithRouge < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet

  def link(link, title, alt_text)
    if link.to_s[0] == '#'
      "<a href=\"#{link}\">#{alt_text}</a>"
    else
      "<a target=\"_blank\" href=\"#{link}\">#{alt_text}</a>"
    end
  end

  def autolink(link, link_type)
    return link unless link_type == :url

    if link.to_s[0] == '#'
      "<a href=\"#{link}\">#{link}</a>"
    else
      "<a target=\"_blank\" href=\"#{link}\">#{link}</a>"
    end
  end

  def block_code(code, metadata)
    metadata ||= ""
    sections = metadata.split(':')
    if sections.size == 2
      filename = sections[1]
      lang     = sections[0]
    elsif metadata == 'math'
      return %[<div class="code-block">#{filename_block(filename)}<div class="mathjax">$$ #{ERB::Util.html_escape(code)} $$</div></div>]
    elsif metadata.index('.') || !Linguist::Language.find_by_alias(metadata)
      filename = metadata
      lang = Linguist::Language.find_by_filename(filename).first.try(:default_alias_name)
    else
      filename = metadata
      lang     = metadata
    end

    %[<div class="code-block">#{filename_block(filename) + super(code, lang)}</div>]
  end

  def raw_html(raw_html)
    return '' if raw_html.match(/^<meta/i).present?
    raw_html
  end

private

  def filename_block(filename)
    return '' if filename.blank?
    %[<div class="code-filename"><i class="fa fa-file-code-o"></i>#{Sanitize.clean(filename)}</div>]
  end
end
