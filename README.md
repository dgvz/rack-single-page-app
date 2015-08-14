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

### Rack

In `config.ru`, configure `Rack::SinglePageApp` by passing the destination file to the constructor:

```ruby
run Rack::SinglePageApp.new("public/index.html")
```

Generally, you'll run `Rack::Static` higher up in your `config.ru` so that you deliver static assets prior to single-page-app fall-through.

### Testing

To contribute to the project, begin by cloning the repo and installing the necessary gems:

    gem install json rack ruby-prof test-spec test-unit

To run the entire test suite, run

    rake test
