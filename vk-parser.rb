require './auth_controller.rb'
require './attachments_parser.rb'

# console_parser = ConsoleParser.new
auth_controller = AuthController.new
# attachments_parser = AttachmentsParser.new(auth_controller.authorize)
attachments_parser = AttachmentsParser.new('16f939493e3579127aa9a1c9ecc39b5cf7dc4aab3346c97bd8626ddeff5d4ad34f44306ff47cadf81153d')

attachments_parser.get_dialog_pics(103349989, 200, 0)
