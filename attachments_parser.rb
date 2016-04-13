require 'net/http'
require 'json'
require 'cgi'
require './photos.rb'
require './file_manager.rb'
require './console.rb'

class AttachmentsParser

  def initialize(access_token)
    @access_token = access_token
    @file_manager = FileManager.new
    @photos = Array.new
    @console = Console.new
  end

  def get_dialog_pics(uid, count)
    photos = Array.new
    start_from = 0
    counter = 1
    url = next_url(uid, count, start_from)
    response = get_by_url(url)
    while (!start_from.nil?)
      start_from = next_from(response)
      if (start_from.nil?)
        photos = photos.concat response_to_url_arr(response, false)
      else
        photos = photos.concat response_to_url_arr(response, true)
      end
      url = next_url(uid, count, start_from)
      response = get_by_url(url)
      @console.parsing_pack(counter)
      counter += 1
    end
    photos
  end

  def next_url(uid, count, start_from)
    "https://api.vk.com/method/messages.getHistoryAttachments?peer_id=#{uid}&start_from=#{start_from}&count=#{count}&media_type=photo&access_token=#{@access_token}"
  end

  def response_to_url_arr(response, bigger200)
    arr = Array.new
    response = json_to_hash(response)['response']
    if (bigger200)
      response.each { |item|
        if (item.instance_of?(Array))
          hash = item[1]
          if (hash.instance_of?(Hash))
            hash = hash['photo']
            if (hash.instance_of?(Hash))
              url = hash[find_max_size(hash)]
              arr << url
            end
          end
        end
      }
    else
      response.each { |item|
        if (item.instance_of?(Hash))
          item = item['photo']
          url = item[find_max_size(item)]
          arr << url
        end
      }
    end
    arr
  end

  def find_max_size(hash)
    arr = []
    ret_before_small = false
    hash.each {
      |key, value|
      key == 'height' && value < 604 ? ret_before_small = true : nil
    }
    hash.each {
      |key, value|
      if (key == 'src_small' && ret_before_small)
        return arr.last
      elsif (key == 'width' && !ret_before_small)
        return arr.last
      else
        arr << key
      end
    }
    return nil
  end

  def get_by_url(url)
    url = URI.encode(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    response.body
  end

  def next_from(response)
    hash = json_to_hash(response)
    hash = hash['response']
    hash.include?('next_from') ? hash['next_from'] : nil
  end

  def json_to_hash(json)
    JSON.parse(json)
  end

end
