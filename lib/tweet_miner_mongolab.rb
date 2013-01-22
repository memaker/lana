require 'mongo'

class TweetMiner
  attr_writer :db_connector
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def db
    @db ||= connect_to_db
  end

  def statuses
    # @statuses ||= db['statuses']
    @statuses ||= db['tweets']
  end
  
  def insert_status(status)
    statuses.insert status
  end

  private
  def connect_to_db
    # @db_connector ||= Mongo::Connection.new(options['host'], options['port']).db(options['database'])
    @connection ||= Mongo::Connection.from_uri('mongodb://twitteruser:demopass@ds049157.mongolab.com:49157/twittermometro')
    @db_connector = @connection.db('twittermometro')
  end
end
