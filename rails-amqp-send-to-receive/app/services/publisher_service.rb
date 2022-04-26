class PublisherService
  def initialize
    @connection = Bunny.new(hostname: 'rabbitmq')
    @channel = connection.create_channel
  end

  def send(message)
    exchange = @channel.fanout("publisher", durable: true)

    exchange.publish(message.to_json)
    @connection.close
  end

  private
  def connection
    @connection.start
  end
end