require 'minitest/autorun'
require 'rack/mock'
require 'rack/single_page_app'
require 'mustache'

describe Rack::SinglePageApp do

  specify "should render the file at the given path for all requests" do
    app = Rack::Builder.new do
      use Rack::Lint
      run Rack::SinglePageApp::Index.new('test/statics/index.html')
    end

    response = Rack::MockRequest.new(app).get('/')
    response.body.must_equal("My Lovely Horse\n")
    response.status.must_equal(200)
  end

  specify "should render the template with given context values" do
    context = {
      title: "My Lovely Horse"
    }

    app = Rack::Builder.new do
      use Rack::Lint
      run Rack::SinglePageApp::Template.new('test/statics/template.html', context)
    end

    response = Rack::MockRequest.new(app).get('/')
    response.body.must_equal("<title>My Lovely Horse</title>\n")
    response.status.must_equal(200)
  end
end
