# Rack Single Page App Middleware

This middleware for Rack will route all web requests to a single file and return a '200' status code.

The intention is to allow rack-based application servers to run single-page webapps which use HTML5 routing, a
common pattern which is normally handled by the front-end web server.

If you are unable or unwilling to reconfigure your web server, this gem may provide what you require!


## Installation

Install the gem:

`gem install rack-single-page-app`

Or in your Gemfile:

```ruby
gem 'rack-single-page-app', :require => 'rack/single_page_app'
```

## Configuration

### Static Index Page

In `config.ru`, configure `Rack::SinglePageApp::Index` by passing the destination file to the constructor:

```ruby
run Rack::SinglePageApp::Index.new("public/index.html")
```

Generally, you'll run `Rack::Static` higher up in your `config.ru` so that you deliver static assets prior to single-page-app fall-through.

### Mustache Templates

Use `Rack::SinglePageApp::Template` to compile the static output from a Mustache template. Pass the path to the template and a context object to the constructor:

```ruby
run Rack::SinglePageApp::Index.new("templates/index.html", context)
```

Note that this template will be compiled once in-memory when the app starts up, and the content will be static for the lifetime of the app.

### Testing

To contribute to the project, begin by cloning the repo and installing the necessary gems:

    gem install json rack ruby-prof test-spec test-unit

To run the entire test suite, run

    rake test
