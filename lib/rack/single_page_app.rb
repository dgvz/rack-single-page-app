require 'rack'
require 'git-version-bump'

module Rack
  # Rack::SinglePageApp is a default endpoint. Initialize with the path to
  # your index page.

  class SinglePageApp
    F = ::File

    def self.release
      GVB.version
    end

    def initialize(path)
      file = F.expand_path(path)
      @content = F.read(file)
      @length = @content.size.to_s
    end

    def call(env)
      [200, {'Content-Type' => 'text/html', 'Content-Length' => @length}, [@content]]
    end
  end
end

