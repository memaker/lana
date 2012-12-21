# gems
require 'bundler'
Bundler.require

# libs
require_relative 'tweet_miner'

# config
twitter_settings = YAML.load_file File.expand_path(File.dirname(__FILE__) + './../config/twitter.yml')
mongo_settings   = YAML.load_file File.expand_path(File.dirname(__FILE__) + './../config/mongodb.yml')

# tweetstream
TweetStream.configure do |config|
  config.consumer_key       = twitter_settings['consumer_key']
  config.consumer_secret    = twitter_settings['consumer_secret']
  config.oauth_token        = twitter_settings['oauth_token']
  config.oauth_token_secret = twitter_settings['oauth_token_secret']
end

# miner
miner = TweetMiner.new(mongo_settings)

# stream
stream = TweetStream::Client.new
stream.on_error { |msg| puts msg }
stream.on_timeline_status do |status|
  # convert status to hash
  miner.insert_status status.to_hash
  print "."
end

# start stream
stream.userstream
