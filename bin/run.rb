require_relative '../config/environment'

ActiveRecord::Base.logger = nil

# Title.new.start
fork{exec 'lolcat -a -d 5 lib/titlesequence.plaintext'}
sleep 9
DirectoryController.new.start

