# gems
require 'bundler'
Bundler.require

# libs
require_relative 'tweet_miner'

# config
settings = YAML.load_file File.expand_path(File.dirname(__FILE__) + "./../config/#{ARGV[0]}.yml")

# miner
miner = TweetMiner.new(settings)

# rgl lib
require "rgl/adjacency"
require "rgl/dot"

graph = RGL::DirectedAdjacencyGraph.new

miner.mentions_by_user.fetch("results").each do |user|
  user.fetch("value").fetch("mentions").each do |mention|
    graph.add_edge(user.fetch("_id"), mention)
  end
end

# creates graph.dot, graph.png
graph.write_to_graphic_file

# run neato to convert to png
# `brew install graphviz`
#`neato -Tpng graph.dot -o mentions.png`

# en nuestro caso
#`dot -Tpng graph.dot > output.png`
