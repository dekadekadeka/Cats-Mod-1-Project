require_relative '../config/environment'

ActiveRecord::Base.logger = nil

fork{ exec 'afplay', 'cat_scratch_fever.mp3' }

sleep(9)

# Title.new.start <<<--- BACKUP ONLY

fork{exec 'lolcat -a -d 5 lib/titlesequence.plaintext'}

sleep(9)

DirectoryController.new.start