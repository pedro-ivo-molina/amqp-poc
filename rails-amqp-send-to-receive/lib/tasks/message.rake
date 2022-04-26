require 'json'

namespace :message do
  desc "Envio e recebimento de mensagens via amqp"

  task start_sending_end_receiving: :environment do
    puts "Informe a quantidade de mensagens que quer enviar:" 
    quantity = STDIN.gets.strip.to_i

    puts "Informe a mensagem que quer enviar:"
    message = STDIN.gets.strip

    publisher = PublisherService.new

    quantity.times do
      publisher.send(message: message.to_json)
    end

    puts "Veja o localhost do RabbitMQ! =D"
  end
end