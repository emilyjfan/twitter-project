require 'sinatra'
require 'twitter'
require File.expand_path '../twitter_config.rb', __FILE__

get '/' do
  search = CLIENT.search('to:justinbieber marry me', result_type: 'recent').take(3).collect do |tweet|
    { tweet.user.screen_name => tweet.text }
  end
  # ["{'user_name': 'text'}"]
  "{'body': #{search.to_json}}"
end