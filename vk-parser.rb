require './console_parser.rb'
require './attachments_parser.rb'

console_parser = ConsoleParser.new
params = console_parser.get_parameters
attachments_parser = AttachmentsParser.new(params.arguments[0])

attachments_parser.get_dialog_pics(params.arguments[1], 200, 0)
