require './auth_controller.rb'
require './attachments_parser.rb'

# console_parser = ConsoleParser.new
auth_controller = AuthController.new
# attachments_parser = AttachmentsParser.new(auth_controller.authorize)
attachments_parser = AttachmentsParser.new('TOKEN')

attachments_parser.get_dialog_pics(103349989, 200, 0)
