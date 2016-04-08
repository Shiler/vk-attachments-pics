require 'colorize'
require 'slop'

class Console

  def get_parameters
    opts = Slop.parse do |o|
      o.string '...'
      o.integer '...'
    end
    opts
  end

  # ---- notifications block ----

  def saving(count)
    puts "Photos count: #{count}".colorize(:red)
  end

  def saving_number(i)
    puts "Saving photo: #{i}".colorize(:yellow)
  end
end
