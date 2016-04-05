require 'colorize'

class ConsoleParser

  def ask_target_user_id
    # todo
  end

  def auth_dialogue
    str = "1. Open the following link in browser.\n"
    str.concat "2. Authorize standalone app.\n"
    str.concat "3. Copy access_token from url and paste here."
    puts str.colorize(:yellow)
    url = 'https://oauth.vk.com/authorize?client_id=5376127&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=messages&response_type=token&v=5.50'
    puts "#{url}".colorize(:red)
    gets
  end

end
