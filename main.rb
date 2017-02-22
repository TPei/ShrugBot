require 'telegram/bot'
require 'dotenv'
Dotenv.load

token = ENV['BOT_TOKEN']

while(true)
  begin
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        if message.text
          if message.text.start_with? '/shrug'
            bot.api.send_message(chat_id: message.chat.id, text: '¯\_(ツ)_/¯')
          end
        end
      end
    end
  rescue => e
    puts e.inspect
  end
end
