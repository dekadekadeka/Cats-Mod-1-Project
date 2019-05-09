require_relative '../config/environment'

ActiveRecord::Base.logger = nil

# pid = fork{ exec 'afplay', 'cat_scratch_fever.mp3' }

# Title.new.start

DirectoryController.new.start