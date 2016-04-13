require 'open-uri'
require 'colorize'
require 'fileutils'
require 'openssl'
require './console.rb'

class FileManager

  def initialize
    @console = Console.new
  end

  def save_photos(photos)
    dir = 'photos'
    rm_dir(dir)
    counter = 1
    errors = 0
    mkdir(dir)
    @console.saving(photos.count)
    photos.each {
      |item|
      File.open("#{dir}/#{counter}.jpg", 'wb') do |fo|
        @console.saving_number(counter)
        if (!item.nil?)
          fo.write open(item, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
          counter += 1
        else
          errors += 1
        end
      end
    }
    @console.done(counter-1, errors)
  end

  def mkdir(name)
    Dir.mkdir name unless File.exists?(name)
  end

  def rm_dir(name)
    FileUtils.rm_rf(name)
  end

end