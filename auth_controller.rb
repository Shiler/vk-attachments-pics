require './console_parser.rb'

class AuthController

  def initialize
    @cp = ConsoleParser.new
  end

  def authorize
    @access_token = @cp.auth_dialogue
  end

end
