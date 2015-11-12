require 'redcarpet'
require 'lib/html_with_rouge'

module HTML
  class Pipeline
    # HTML Filter that converts Markdown text into HTML and converts into a
    # DocumentFragment. This is different from most filters in that it can take a
    # non-HTML as input. It must be used as the first filter in a pipeline.
    #
    # Context options:
    #   :redcarpet_options =>  {}
    #
    # This filter does not write any additional information to the context hash.
    class RedcarpetFilter < TextFilter
      def initialize(text, context = nil, result = nil)
        super text, context, result
        @text = @text.gsub "\r", ''
      end

      # Convert Markdown to HTML using the best available implementation
      # and convert into a DocumentFragment.
      def call
        # mode = (context[:gfm] != false) ? :gfm : :markdown
        # html = GitHub::Markdown.to_html(@text, mode)
        # html.rstrip!
        # html

        options = context[:redcarpet_options] || {}
        renderer = HtmlWithRouge.new(
          filter_html: options.fetch(:filter_html, false),
          hard_wrap:   options.fetch(:hard_wrap, true)
        )
        options.reject! { |k, v| [:filter_html, :hard_wrap].include?(k) }
        markdown = Redcarpet::Markdown.new(renderer, options)
        html = markdown.render(@text)
        html.rstrip!
        html
      end
    end
  end
end
