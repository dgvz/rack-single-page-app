require 'minitest/autorun'
require 'rack/mock'
require 'rack/single_page_app'

describe "Rack::SinglePageApp" do

  specify "should render the file at the given path for all requests" do
    app = Rack::Builder.new do
      use Rack::Lint
      run Rack::SinglePageApp.new('test/statics/index.html')
    end
    response = Rack::MockRequest.new(app).get('/')
    response.body.must_equal("My Lovely Horse\n")
    response.status.must_equal(200)
  end

end
