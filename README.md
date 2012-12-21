Lana Project
============

Collect and analyze the tweets. Idea and code from Greg Moreno
[Part 1] (http://gregmoreno.wordpress.com/2012/09/05/mining-twitter-data-with-ruby-mongodb-and-map-reduce/) 
[Part 2] (http://gregmoreno.wordpress.com/2012/09/20/mining-twitter-data-with-ruby-visualizing-user-mentions/)

```
  # adjust settings in config/*.yml
  ruby lib/collect.rb example   # where example is the instance id. Leave this running to collect tweets to mongodb
  ruby lib/counter.rb   # show stats for user tweet counts
  ruby lib/mentions.rb  # show stats for user tweet mentions in graph.dot
  
  # start using
  kkruby lib/collect.rb zara01

  neato -Tpng graph.dot -o mentions.png  # convert dot to png file
