require 'mongo'
require_relative 'status_counter'
require_relative 'user_mention'

class TweetMiner
  include StatusCounter
  include UserMention

  attr_writer :db_connector
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def db
    @db ||= connect_to_db
  end

  def statuses
    @statuses ||= db['statuses']
  end

  def insert_status(status)
    statuses.insert status
  end


  private
  def connect_to_db
    @db_connector ||= Mongo::Connection.new(options['host'], options['port']).db(options['database'])
  end
end
