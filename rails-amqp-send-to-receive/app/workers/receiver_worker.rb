class ReceiverWorker
  include Sneakers::Worker
  from_queue "receiver_queue", env: nil

  def perform(message)
    puts '-----------------entrou no worker do receiver--------------------------'
    data = ActiveSupport::JSON.decode(message).with_indifferent_access

    puts data
    ack!
  end
end