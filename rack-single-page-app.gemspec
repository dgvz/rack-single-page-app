# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

begin
  require 'git-version-bump'
rescue LoadError
  nil
end

Gem::Specification.new do |spec|
  spec.name          = "rack-single-page-app"
  spec.version       = GVB.version rescue "0.0.0.1.ENOGVB"
  spec.date          = GVB.date    rescue Time.now.strftime("%F")

  spec.authors       = ["Rob Sharp"]
  spec.email         = ["rob.sharp@digivizer.com"]

  spec.summary       = %q{A rack middleware to assist running a single-page-app on rack.}
  spec.description   = %q{If you're running a javascript single-page-app with html5 routing,
                          you may notice that deep links will 404 unless your web front-end is
                          configured to rewrite all non-asset paths to index.html. If you'd like
                          to achieve the same rewrite using rack, this is the gem for you!}
  spec.homepage      = "https://github.com/qnm/rack-single-page-app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rack', '~> 1.4'
  spec.add_runtime_dependency 'git-version-bump', '~> 0.15'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 5.6'
end
