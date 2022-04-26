class ReceiverWorker
  include Sneakers::Worker
  from_queue "sender_queue", env: nil

  def work(message)
    puts '-----------------entrou no worker do receiver--------------------------'

    puts message
    ack!
  end
end