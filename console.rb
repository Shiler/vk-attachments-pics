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

  def done(count, errors)
    puts 'Parsing: SUCCESSFUL'.colorize(:red)
    puts "Downloaded #{count} pictures.".colorize(:blue)
    puts "ERRORS: #{errors}".colorize(:red)
  end

  def parsing_pack(number)
    puts "Parsing url pack of 200 photos: #{number}".colorize(:green)
  end
end
