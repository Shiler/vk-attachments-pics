require 'net/http'
require 'json'
require 'cgi'
require './photos.rb'
require './file_manager.rb'

class AttachmentsParser

  def initialize(access_token)
    @access_token = access_token
    @file_manager = FileManager.new
  end

  def get_dialog_pics(uid, count, hash, start_from)
    hash.nil? ? (hash = Hash.new) : hash
    url = "https://api.vk.com/method/messages.getHistoryAttachments?peer_id=#{uid}&count=#{count}&media_type=photo&access_token=#{@access_token}"
    response = get_by_url(url)
    nf = next_from(response)
    if nf.nil?
      temp = json_to_hash(response)
      temp = temp['response']
      photos = create_photos_obj(temp)
      @file_manager.save_photos(photos.photos)
    else
      get_dialog_pics(uid, count, hash, nf)
    end
  end

  def create_photos_obj(hash)
    photos = Photos.new
    hash.each { |item|
      if (item.instance_of?(Hash))
        photo = item['photo']
        url = find_max_size(photo)
        photos.add(url)
      end
    }
    photos
  end

  def find_max_size(hash)
    arr = []
    hash.each {
      |key, value|
      key == 'width' ? (return arr.last) : arr << value
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

  # it is not necessary for this app. just test
  def send_message(id, message)
    url = "https://api.vk.com/method/messages.send?user_id=#{id}&message=#{message}&access_token=#{@access_token}"
    get_by_url(url)
  end

  def next_from(response)
    hash = json_to_hash(response)
    hash = hash['response']
    hash.include?('next_from') ? next_f = hash['next_from'] : next_f = nil
    next_f
  end

  def json_to_hash(json)
    JSON.parse(json)
  end

end
