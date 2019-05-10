require_relative '../config/environment'

ActiveRecord::Base.logger = nil

fork{ exec 'afplay', 'cat_scratch_fever.mp3' }

sleep(10)

# Title.new.start <<<--- BACKUP ONLY

fork{exec 'lolcat -a -d 4 lib/titlesequence.plaintext'}

sleep(8)

DirectoryController.new.start