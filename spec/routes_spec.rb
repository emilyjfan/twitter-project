require 'pry'
require 'rspec'
require 'rack/test'
require 'json'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../routes.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

RSpec.describe 'Routes' do
  describe 'GET /' do
    it 'responses with success' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'responses with JSON' do
      get '/'
      expect(JSON.parse(last_response.body)['body']).to eq('success')
    end
  end

end