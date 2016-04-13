require 'open-uri'
require 'colorize'
require 'fileutils'
require './console.rb'

class FileManager

  def initialize
    @console = Console.new
  end

  def save_photos(photos)
    dir = 'photos'
    rm_dir(dir)
    counter = 1
    mkdir(dir)
    @console.saving(photos.count)
    photos.each {
      |item|
      File.open("#{dir}/#{counter}.jpg", 'wb') do |fo|
        @console.saving_number(counter)
        fo.write open(item).read
      end
      counter += 1
    }
    @console.done(counter-1)
  end

  def mkdir(name)
    Dir.mkdir name unless File.exists?(name)
  end

  def rm_dir(name)
    FileUtils.rm_rf(name)
  end

end