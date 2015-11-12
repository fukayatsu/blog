require 'tilt/template'
require 'lib/redcarpet_filter'

class HtmlPipelineTemplate < Tilt::Template
  self.default_mime_type = 'text/html'

  def self.engine_initialized?
    defined?(::Html::Pipeline)
  end

  def initialize_engine
    require 'html/pipeline'
  end

  def prepare
    filters = [
      HTML::Pipeline::RedcarpetFilter,
      HTML::Pipeline::EmojiFilter
    ]
    options = {
      asset_root: '/images/',
      redcarpet_options: {
        filter_html:        false,
        hard_wrap:          true,
        autolink:           true,
        fenced_code_blocks: true,
        gh_blockcode:       true,
        lax_spacing:        true,
        lax_html_blocks:    true,
        no_intra_emphasis:  true,
        strikethrough:      true,
        tables:             true,
        footnotes:          true
      }
    }
    @engine = HTML::Pipeline.new(filters, options)
  end

  def evaluate(scope, locals, &block)
    @output ||= @engine.call(data)[:output].to_s
  end
end
