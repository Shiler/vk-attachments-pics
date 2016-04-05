require 'net/http'
require 'json'
require 'cgi'

class AttachmentsParser

  def initialize(access_token)
    @access_token = access_token

  end

  def get_dialog_pics(uid, count, start_from)
    hash = Hash.new
    url = "https://api.vk.com/method/messages.getHistoryAttachments?peer_id=#{uid}&count=#{count}&media_type=photo&access_token=#{@access_token}"
    puts 'get_dialog_pics method'.colorize(:red) # debug
    response = get_by_url(url)
    nf = next_from(response)
    if nf.nil?
      temp = json_to_hash(response)
      temp = temp['response']
      puts temp.to_s.colorize(:blue)
      create_photos_obj(temp)
      puts temp.to_s.colorize(:red)
    else

    end
    puts nf.colorize(:blue)
  end

  def create_photos_obj(hash)
    array = Array.new
    hash.each { |item|
      puts item.to_s.colorize(:yellow)
    }
  end

  def get_by_url(url)
    url = URI.encode(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    content = response.body
    puts content # debug
    return content
  end

  def send_message(id, message)
    url = "https://api.vk.com/method/messages.send?user_id=#{id}&message=#{message}&access_token=#{@access_token}"
    puts 'send_message method'.colorize(:red) # debug
    get_by_url(url)
  end

  def next_from(response)
    hash = json_to_hash(response)
    hash = hash['response']
    hash.include?('next_from') ? next_f = hash['next_from'] : next_f = nil
    next_f
  end

  # idk what the fuck. what is the purpose of this method?
  # def get_dialog_id_by_uid(uid)
  #   url = "https://api.vk.com/method/messages.getHistory?user_id=#{uid}&count=1&access_token=#{@access_token}"
  #   puts 'get_dialog_id_by_uid method'.colorize(:red) # debug
  #   response = get_by_url(url)
  #   puts response.to_s.colorize(:blue)
  #   t_array = response.split "\"uid\":"
  #   id = (t_array[1].split ',')[0].to_i
  # end

  def json_to_hash(json)
    JSON.parse(json)
  end

end
