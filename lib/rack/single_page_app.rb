require 'rack'
require 'git-version-bump'

module Rack
  module SinglePageApp
    def self.release
      GVB.version
    end

    F = ::File

    # The base Rack application which sends default HTML content.
    class Base
      # @param content [String] Response body content
      def initialize(content)
        @content = content
        @length = @content.size.to_s
      end

      def call(env)
        [200, {'Content-Type' => 'text/html', 'Content-Length' => @length}, [@content]]
      end
    end

    # Respond to generic server requests with a static HTML index page.
    #
    # @example
    #   run Rack::SinglePageApp::Index('assets/index.html')
    #
    class Index < Base
      # @param path [String] Path to static file
      def initialize(path)
        file = F.expand_path(path)
        super(F.read(file))
      end
    end

    # Respond to generic server requests with a Mustache template, rendered with
    # the provided context.
    #
    # Mustache is an optional dependency, so needs to be required before this
    # object is constructed.
    #
    # @example
    #   require 'mustache'
    #
    #   context = {
    #     title: "App Title",
    #     body_class: "app-layout app-layout-fixed-width",
    #     root_element_id: "app-root",
    #   }
    #   run Rack::SinglePageApp::Template.new('assets/index.mustache', context)
    #
    class Template < Base
      # @param path [String] Path to template
      # @param context [Hash] Context object
      def initialize(path, context)
        template = F.read(F.expand_path(path))
        output = ::Mustache.render(template, context)
        super(output)
      end
    end
  end
end
