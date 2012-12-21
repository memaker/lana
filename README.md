Lana Project
============

Collect and analyze the tweets. Idea and code from [Greg Moreno]
(http://gregmoreno.wordpress.com/2012/09/05/mining-twitter-data-with-ruby-mongodb-and-map-reduce/) [Part 1]
(http://gregmoreno.wordpress.com/2012/09/20/mining-twitter-data-with-ruby-visualizing-user-mentions/) [Part 2]

```
  # adjust settings in config/*.yml
  ruby lib/collect.rb   # leave this running to collect tweets to mongodb
  ruby lib/counter.rb   # show stats for user tweet counts
  ruby lib/mentions.rb  # show stats for user tweet mentions in graph.dot

  neato -Tpng graph.dot -o mentions.png  # convert dot to png file
