require_relative '../config/environment'

ActiveRecord::Base.logger = nil

DirectoryController.new.start

