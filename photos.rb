
class Photos

  def initialize
    @photos = Array.new
  end

  def add_photo(url)
    @photos.push(url)
  end

end
