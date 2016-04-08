
class Photos

  def initialize
    @photos = Array.new
  end

  def add(url)
    @photos << url
  end

  def to_s
    @photos.to_s
  end

  def photos
    @photos
  end

end
