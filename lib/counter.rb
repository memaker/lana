# gems
require 'bundler'
Bundler.require

# libs
require_relative 'tweet_miner'

# config
settings = YAML.load_file File.expand_path(File.dirname(__FILE__) + "./../config/#{ARGV[0]}.yml")

# miner
miner = TweetMiner.new(settings)

puts 'Status count by user'
results = miner.status_count_by_user 
ap results

puts 'Status count by hour of day'
results = miner.status_count_by_hday
ap results
