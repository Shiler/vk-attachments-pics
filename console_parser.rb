require 'colorize'
require 'slop'

class ConsoleParser

  def get_parameters
    opts = Slop.parse do |o|
      o.string '...'
      o.integer '...'
    end
    opts
  end
end
