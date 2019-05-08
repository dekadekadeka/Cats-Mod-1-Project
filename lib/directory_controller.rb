class DirectoryController

    def start
        main_menu
    end

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

    def main_menu
        puts "\nHELLO! Welcome to the Atlanta Cat Directory!"
        puts "\nYou can use this directory to do any of the following things:"
        puts "\n  1 - List all of the cats that live in Atlanta."
        puts "  2 - List all of your fellow Atlanta residents."
        puts "  3 - Add your cat to the directory."
        puts "  4 - Remove yourself or your cat from the directory."
        puts "  5 - Compare two cats to see if they'll live harmoniously."
        puts "  6 - See which type of food will attract a certain cat."
        puts "  7 - See which neighbor is the Crazy Cat Lady."
        puts "  8 - Update your information."
        puts "  9 - Update a cat's information."

        choice = gets.chomp

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
                update_cat_info
                return_to_main?
            else
                puts "\nInvalid Entry. Please enter a choice, 1-9."
                main_menu
        end
    end

    def list_cats
        # lists all known cats and their attributes
        Cat.all.select { |x| puts x.name }
    end

    def list_owners
        # list all known owners and their attributes
        Owner.all.select { |x| puts x.name }
    end

    def add_cat
        puts "    /\\__/\\"
        puts "   /'    \'\\"
        puts " === 0  0 ==="
        puts "   \\  --  /"
        puts "  /        \\"
        puts " /          \\"
        puts "|            |"
        puts " \\  ||  ||  /"
        puts "  \\_oo__oo_/#######o"

        puts "\nADD A CAT!"

        puts "\nWhat is this cat's name?"
            cat_name = gets.chomp
        puts "\nWhat color is this cat?"
            cat_color = gets.chomp
        puts "\nWhat breed is this cat?"
            cat_breed = gets.chomp
        puts "\nWhat is this cat's favorite food?"
            cat_food = gets.chomp
        puts "\nDoes this cat get along with other cats? (y/n)"
            cat_temperament = gets.chomp
            loop do
                if cat_temperament == "y"
                    cat_temperament = true
                    break
                elsif cat_temperament == "n"
                    cat_temperament = false
                    break
                else
                    puts "\nPlease enter y or n."
                end
            end
        puts "\nWould you like to set this cat's owner now? (y/n)  Note: you can always edit this later with Main Menu option 9."
            set_owner = gets.chomp
            loop do
                if set_owner == "y"
                    edit_cat_info
                    break
                elsif set_owner == "n"
                    break
                else
                    puts "\nPlease enter y or n."
                end
            end

        Cat.create(name: cat_name, breed: cat_breed, color: cat_color, favorite_food: cat_food, temperament: cat_temperament)
    end

    def remove
        puts "\nWhich would you like to remove?"
        puts "  1. Yourself"
        puts "  2. A cat"
        puts "  3. I changed my mind"
        choice = gets.chomp
        case (choice.to_i)
            when 1
                puts "☹️ So sad to see you go... what's your name?"
                owner_name = gets.chomp
                destroy = Owner.find_by(name: owner_name)
                if destroy.nil?
                    puts "This owner doesn't exist"
                    remove
                else
                    destroy.destroy
                    puts "Bye!"
                end
            when 2
                puts "😿 What's the cat's name?"
                cat_name = gets.chomp
                destroy = Cat.find_by(name: cat_name)
                if destroy.nil?
                    puts "This cat doesn't exist"
                    remove
                else
                    destroy.destroy
                    puts "Bye!"
                end
            when 3
                main_menu
        end
    end

    def compare_cats
        puts "Which two cats would you like to compare?"
        puts "or type 'exit' to go back to the main menu"
        puts "Name of first cat:"
        first = gets.chomp
            if first == "exit"
                main_menu
            end
        puts "Name of second cat:"
        second = gets.chomp
        cat_1 = Cat.find_by(name: first)
        cat_2 = Cat.find_by(name: second)
        case
            when cat_1.nil? || cat_2.nil?
                puts "One of both of those cats isn't in the database."
                puts "Please put in a valid name"
                puts ""
                compare_cats
            else
                if cat_1.name == cat_2.name
                    puts "That's the same cat..."
                elsif cat_1.temperament == true && cat_2.temperament == true
                    puts "These cats get along with everyone 😻"
                elsif cat_1.temperament == true && cat_2.temperament == false
                    puts "These cats will NOT get along!"
                elsif cat_1.temperament == false && cat_2.temperament == true
                    puts "These cats will NOT get along!"
                elsif cat_1.temperament == false && cat_2.temperament == false
                    puts "These cats don't get along with anybody!!"
            end
        end
    end

    def crazy_cat_lady
        cat_count = Owner.all.map {|owner| owner.cats}.max{|cats| cats.length}.count
        most_owner = Owner.all.select {|owner| owner.cats.max}.last

        puts "The person with the most cats is #{most_owner.name} with #{cat_count} cats! 🙀"
    end

    # 8 - Update your information
    # Asks user for first name
    # Compares name to database via (name: )
    # Gives list of what they can change
    # User selects one attribute
    # 

    def update_owner_info
        puts "\nPlease enter your first name and then press the RETURN key."
            first_name = gets.chomp
            owner = Owner.all.find_by(name: first_name)
        puts "\nHowdy, #{first_name}! What information would you like to update?"
        puts "\n   1 - Your address"
        puts "   2 - The type of food you leave on the porch (wet or dry)"
        puts "   3 - Your cat ownership status"
        puts "   4 - Your dog ownership status"
        puts "   5 - Your current neighborhood"
        puts "   6 - Return to main menu"
            choice = gets.chomp
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
                    puts "\nDo you currently own a cat? Please enter y or n."
                    cat_status = gets.chomp
                    loop do
                        if cat_status == "y"
                            cat_status = true
                            break
                        elsif cat_status == "n"
                            cat_status = false
                            break
                        else
                            puts "\nPlease enter y or n."
                        end
                    end
                    owner.cat_already = cat_status
                when 4 #dog?
                    puts "\nDo you currently own a dog? Please enter y or n."
                    dog_status = gets.chomp
                    loop do
                        if dog_status == "y"
                            dog_status = true
                            break
                        elsif dog_status == "n"
                            dog_status = false
                            break
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
                        new_hood_instance = Neighborhood.create(new_hood, city_state)
                    owner.neighborhood_id = new_hood_instance.id
                when 6
                    main_menu
                end
    owner.save
    end

    def edit_cat_info
    
    end


end
