# gems
require 'bundler'
Bundler.require

# libs
require_relative 'tweet_miner'

# config
mongo_settings = YAML.load_file File.expand_path(File.dirname(__FILE__) + './../config/mongodb.yml')

# miner
miner = TweetMiner.new(mongo_settings)

puts 'Status count by user'
results = miner.status_count_by_user 
ap results

puts 'Status count by hour of day'
results = miner.status_count_by_hday
ap results
