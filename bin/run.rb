require_relative '../config/environment'

ActiveRecord::Base.logger = nil

# Title.new.start
DirectoryController.new.start

