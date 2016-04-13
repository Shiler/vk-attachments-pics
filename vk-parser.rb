require './console.rb'
require './attachments_parser.rb'
require './file_manager.rb'

console_parser = Console.new
params = console_parser.get_parameters
attachments_parser = AttachmentsParser.new(params.arguments[0])

photos = attachments_parser.get_dialog_pics(params.arguments[1], 200)
file_manager = FileManager.new
file_manager.save_photos(photos)
