require 'open-uri'
require 'colorize'
require './console.rb'

class FileManager

  def initialize
    @console = Console.new
  end

  # NOT TESTED!
  def save_photos(photos)
    dir = 'photos'
    counter = 1
    mkdir(dir)
    @console.saving(photos.count)
    photos.each {
      |item|
      File.open("#{dir}/#{counter}.png", 'wb') do |fo|
        @console.saving_number(counter)
        fo.write open(item).read
      end
      counter += 1
    }
  end

  def mkdir(name)
    Dir.mkdir name unless File.exists?(name)
  end

end