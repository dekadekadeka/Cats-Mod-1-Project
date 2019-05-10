class DirectoryController

    def start
        main_menu
    end

# ---------------------------------------------------------------------------------------------------------

    def return_to_main?
        puts "\nReturn to main menu? (y/n)"
        choice = gets.chomp
        if choice == "y"
            main_menu
        elsif choice == "n"
            puts "\nWell, there's nothing else you can do here. We're going back to the main menu anyway."
            main_menu
        else
            puts "\nInvalid entry. Please try again."
            return_to_main?
        end
    end

# ---------------------------------------------------------------------------------------------------------

    def main_menu
        puts "\nHELLO! Welcome to the Atlanta Cat Directory!"
        prompt = TTY::Prompt.new
        choices = {
            "  1 - List all of the cats that live in Atlanta." => 1,
            "  2 - List all of your fellow Atlanta residents." => 2,
            "  3 - Add your cat to the directory." => 3,
            "  4 - Remove yourself or your cat from the directory." => 4,
            "  5 - Compare two cats to see if they'll live harmoniously." => 5,
            "  6 - See which type of food will attract a certain cat." => 6,
            "  7 - See which neighbor is the Crazy Cat Lady." => 7,
            "  8 - Update your information." => 8,
            "  9 - Update a cat's information." => 9,
            "  10 - Exit the program" => 10 }
        choice = prompt.select("\nWhat would you like to do?\n", choices, per_page: 10)

        case (choice.to_i)
            when 1
                list_cats
                return_to_main?
            when 2
                list_owners
                return_to_main?
            when 3
                add_cat
                return_to_main?
            when 4
                remove
                return_to_main?
            when 5
                compare_cats
                return_to_main?
            when 6
                cats_favorite_food
                return_to_main?
            when 7
                crazy_cat_lady
                return_to_main?
            when 8
                update_owner_info
                return_to_main?
            when 9
                edit_cat_info
                return_to_main?
            when 10
                puts "Bye for now! 😻"
                quit
            else
                puts "\nInvalid Entry. Please enter a choice, 1-10."
                main_menu
        end
    end

# ---------------------------------------------------------------------------------------------------------
# 1 - List all of the cats that live in Atlanta

    def list_cats
        Cat.all.select { |x| puts x.name }
    end

# ---------------------------------------------------------------------------------------------------------
# 2 - List all of your fellow Atlanta residents

    def list_owners
        Owner.all.select { |x| puts x.name }
    end

# ---------------------------------------------------------------------------------------------------------
# 3 - Add your cat to the directory

    def add_cat
        puts "\n\n"
        puts "    /\\__/\\"
        puts "   /'    \'\\"
        puts " === 0  0 ==="
        puts "   \\  --  /"
        puts "  /        \\"
        puts " /          \\"
        puts "|            |"
        puts " \\  ||  ||  /"
        puts "  \\_oo__oo_/#######o"

        puts "\nLET'S ADD A FREAKING CAT!"

        puts "\nWhat is your cat's name?"
            cat_name = gets.chomp
        puts "\nWhat color is #{cat_name}?"
            cat_color = gets.chomp
        puts "\nWhat breed is #{cat_name}?"
            cat_breed = gets.chomp
        puts "\nWhich type of cat food does #{cat_name} prefer? Please enter 'wet' or 'dry'."
            cat_food = gets.chomp

        cat_temp_loop = true
        while cat_temp_loop do
            puts "\nDoes #{cat_name} get along with other cats? Please enter 'y' or 'n'."
            cat_temperament = gets.chomp
                if cat_temperament == "y"
                    cat_temperament = true
                    cat_temp_loop = false
                elsif cat_temperament == "n"
                    cat_temperament = false
                    cat_temp_loop = false
                else
                    puts "\nPlease enter 'y' or 'n'."
                end
        end

        Cat.create(name: cat_name, breed: cat_breed, color: cat_color, favorite_food: cat_food, temperament: cat_temperament)
        
        set_owner_loop = true
        while set_owner_loop do
            puts "\nWould you like to set #{cat_name}'s owner now? (y/n)  Note: you can always edit this later with Main Menu option 9."
            set_owner = gets.chomp
                if set_owner == "y"
                    edit_cat_info
                    set_owner_loop = false
                elsif set_owner == "n"
                    set_owner_loop = false
                else
                    puts "\nPlease enter 'y' or 'n'.\n"
                end
        end

    end

# ---------------------------------------------------------------------------------------------------------
# 4 - Remove yourself or your cat from the directory

    def remove
        prompt = TTY::Prompt.new
        choices = {
            "  1 - Yourself" => 1,
            "  2 - A cat" => 2,
            "  3 - Return to the Main Menu" => 3 }
        choice = prompt.select("\nWhat would you like to remove from the directory?\n", choices, per_page: 3)

        case (choice.to_i)
            when 1
                puts "\nWhat is your name?"
                owner_name = gets.chomp
                destroy = Owner.find_by(name: owner_name)
                puts "\nAll set, #{owner_name}! ☹️ So sad to see you go!"
                if destroy.nil?
                    puts "\nSorry, this owner doesn't exist."
                    remove
                else
                    destroy.destroy
                    puts "\nBye, #{owner_name}!"
                end
            when 2
                puts "\n😿 What is the cat's name?"
                cat_name = gets.chomp
                destroy = Cat.find_by(name: cat_name)
                if destroy.nil?
                    puts "\nSorry, this cat doesn't exist."
                    remove
                else
                    destroy.destroy
                    puts "\nSo long, sweet #{cat_name}!"
                end
            when 3
                main_menu
        end
    end

# ---------------------------------------------------------------------------------------------------------
# 5 - Compare two cats to see if they'll live harmoniously

    def compare_cats
        puts "\nWhich two cats would you like to compare?"
        puts "\nOr, you can type 'exit' to go back to the Main Menu."
        puts "\nPlease enter the name of first cat you'd like to compare..."
        first = gets.chomp
            if first == "exit"
                main_menu
            end
        puts "\nPlease enter the name of second cat..."
        second = gets.chomp
        cat_1 = Cat.find_by(name: first)
        cat_2 = Cat.find_by(name: second)
        case
            when cat_1.nil? || cat_2.nil?
                puts "\nOne or both of those cats is not in the database."
                puts "\nPlease put in a valid name"
                compare_cats
            else
                if cat_1.name == cat_2.name
                    puts "\nThat's the same cat..."
                elsif cat_1.temperament == true && cat_2.temperament == true
                    puts "\nThese cats get along with everyone 😻"
                elsif cat_1.temperament == true && cat_2.temperament == false
                    puts "\nThese cats will NOT get along! 😾"
                elsif cat_1.temperament == false && cat_2.temperament == true
                    puts "\nThese cats will NOT get along! 😾"
                elsif cat_1.temperament == false && cat_2.temperament == false
                    puts "\nThese cats don't get along with anybody!! 😾"
            end
        end
    end

# ---------------------------------------------------------------------------------------------------------
# 6 - See which type of food will attract a certain cat

    def cats_favorite_food
        prompt = TTY::Prompt.new
        choices = {
            "  1 - See which type of food you'll to put out to attract a specific cat" => 1,
            "  2 - View all of the cats that prefer wet food" => 2,
            "  3 - View all of the cats that prefer dry food" => 3,
            "  4 - Return to the Main Menu" => 4 }
        choice = prompt.select("\nIf you're lonely and want a cat, here's the info you'll need to attract one!\n", choices, per_page: 4)
        case (choice.to_i)
            when 1
                puts "\nWhich cat would you like to attract?"
                cat_food_name = gets.chomp
                cat_fav_food = Cat.find_by(name: cat_food_name).favorite_food
                puts "\n#{cat_food_name} prefers #{cat_fav_food} food."
            when 2
                puts "\nCats that prefer wet food:"
                Cat.where(:favorite_food => "wet").select {|cat| puts cat.name}
            when 3
                puts "\nCats that prefer dry food:"
                Cat.where(:favorite_food => "dry").select {|cat| puts cat.name}
            when 4
                main_menu
        end
    end

# ---------------------------------------------------------------------------------------------------------
# 7 - See which neighbor is the Crazy Cat Lady

    def crazy_cat_lady
        cat_lady = Owner.all.inject do |memo, owner|
            memo.cats.count > owner.cats.count ? memo : owner
        end
        puts "The person with the most cats is #{cat_lady.name} with #{cat_lady.cats.count} cats! 🙀"
    end

# ---------------------------------------------------------------------------------------------------------
# 8 - Update your information

    def update_owner_info
        puts "\nPlease enter your first name and then press the RETURN key."
            first_name = gets.chomp
            owner = Owner.all.find_by(name: first_name)

            prompt = TTY::Prompt.new
            choices = {
                "  1 - Your address" => 1,
                "  2 - The type of food you leave on the porch (please enter 'wet' or 'dry')" => 2,
                "  3 - Your cat ownership status" => 3,
                "  4 - Your dog ownership status" => 4,
                "  5 - Your current neighborhood" => 5,
                "  6 - Return to the Main Menu" => 6 }
            choice = prompt.select("\nHowdy, #{first_name}! What information would you like to update?\n", choices, per_page: 6)

            case (choice.to_i)
            when 1 #address
                puts "\nWhat is your new address?  format: 221-B Baker Street"
                new_address = gets.chomp
                owner.address = new_address
            when 2 #food
                puts "\nWhat type of food are you leaving out on your porch, wet or dry?"
                new_food = gets.chomp
                owner.food_provided = new_food
            when 3 #cat?
                cat_status_loop = true
                while cat_status_loop do
                    puts "\nDo you currently own a cat? Please enter y or n."
                    cat_status = gets.chomp
                        if cat_status == "y"
                            cat_status = true
                            cat_status_loop = false
                        elsif cat_status == "n"
                            cat_status = false
                            lcat_status_loop = false
                        else
                            puts "\nPlease enter y or n."
                        end
                end
                owner.cat_already = cat_status
            when 4 #dog?
                dog_status_loop = true
                while dog_status_loop do
                    puts "\nDo you currently own a dog? Please enter y or n."
                    dog_status = gets.chomp
                        if dog_status == "y"
                            dog_status = true
                            dog_status_loop = false
                        elsif dog_status == "n"
                            dog_status = false
                            dog_status_loop = false
                        else
                            puts "\nPlease enter y or n."
                        end
                end
                owner.dog = dog_status
            when 5 #neighborhood
                puts "\nIn which neighborhood are you currently living?"
                new_hood = gets.chomp
                puts "\nCity and state?"
                city_state = gets.chomp
                    hood = Neighborhood.find_by(name: new_hood, location: city_state)
                    owner.neighborhood = hood
                    if hood.nil?
                        new_hood_instance = Neighborhood.create(name: new_hood, location: city_state)
                        owner.neighborhood_id = new_hood_instance.id
                    end
            when 6
                main_menu
            end
    owner.save
    end

# ---------------------------------------------------------------------------------------------------------
# 9 - Update a cat's information

    def edit_cat_info
        puts "\nPlease enter your cat's name and then press the RETURN key."
            kitty_name = gets.chomp
            kitty = Cat.all.find_by(name: kitty_name)

            prompt = TTY::Prompt.new
            choices = {
                "  1 - #{kitty_name}'s current owner" => 1,
                "  2 - #{kitty_name}'s favorite food" => 2,
                "  3 - #{kitty_name}'s temperament with other cats" => 3,
                "  4 - Return to the Main Menu" => 4 }
            choice = prompt.select("\nHowdy, #{kitty_name}'s owner! What information would you like to update?\n", choices, per_page: 3)

            case (choice.to_i)
            when 1 #current owner?
                puts "\nWhat is the first name of #{kitty_name}'s current owner?"
                new_owner = gets.chomp
                new_owner_id = Owner.all.find_by(name: new_owner)
                kitty.owner_id = new_owner_id
                puts "\nYay! #{new_owner} is now #{kitty_name}'s owner!\n"
            when 2 #food
                puts "\nWhich type of cat food does #{kitty_name} prefer, wet or dry?"
                new_fav_food = gets.chomp
                kitty.favorite_food = new_fav_food
            when 3 #temperament
                new_temp_loop = true
                while new_temp_loop do
                    puts "\nDoes #{kitty_name} get along with other cats? Please enter 'y' or 'n'."
                    new_temperament = gets.chomp
                        if new_temperament == "y"
                            new_temperament = true
                            new_temp_loop = false
                        elsif new_temperament == "n"
                            new_temperament = false
                            new_temp_loop = false
                        else
                            puts "\nPlease enter 'y' or 'n'."
                        end
                end
                kitty.temperament = new_temperament
            when 4
                main_menu
            end
    kitty.save
    end

# ---------------------------------------------------------------------------------------------------------
# 10 - Exit the program

    def quit
        pid = fork{ exec 'killall', 'afplay' }
        exit
    end

end