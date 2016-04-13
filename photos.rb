
class Photos

  def initialize
    @url_array = Array.new
  end

  def add(url)
    @url_array << url
  end

  def to_s
    @url_array.to_s
  end

  def url_array
    @url_array
  end

  def add_array(arr)
    @url_array = @url_array + arr
    puts 'added array'
  end

end
