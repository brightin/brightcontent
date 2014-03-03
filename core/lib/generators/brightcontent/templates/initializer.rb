Brightcontent.setup do |config|
  # The path where the admin interface should mount.
  config.path = "admin"

  # Name of the application which is displayed in header.
  # Defaults to Rails application name.
  # config.application_name = "Custom app name"

  # Overwrite Brightcontent locale. Defaults to Rails locale.
  # config.locale = "nl"

  # Set the amount of menu items which are shown directly in the top bar.
  # If there are more resources than this number, the remaining will be 
  # accumulated in a drop down menu.
  # config.main_menu_count = 6

  # The attachments model only allows images and pdf documents by default.
  # Set to empty array to disable.
  # config.attachment_content_types = [/\Aimage/, "application/pdf"]
end
