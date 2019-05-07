class DirectoryController

    def start
        main_menu
    end


    def return_to_main?
        puts "Return to main menu? (y/n)"
        choice = gets.chomp

        if choice == "y"
            main_menu
        elsif choice == "n"
            puts "Well, there's nothing else you can do here. We're going back to the main menu anyway."
            main_menu
        else
            puts "Invalid entry. Please try again."
            return_to_main?
        end
    end


    def main_menu
        puts "HELLO! Welcome to the //Flatiron Cat Directory!"
        puts "You can use this directory to do any of the following things:"
        puts "  1. List all of the cats that live at //Flatiron."
        puts "  2. List all of your fellow //Flatiron students."
        puts "  3. Add your cat to the directory."
        puts "  4. Remove yourself or your cat from the directory."
        puts "  5. Compare two cats to see if they'll live harmoniously."
        puts "  6. See which type of food will attract a certain cat."
        puts "  7. See which student is the Crazy Cat Lady."
        puts "  8. Update your information"
        puts "  9. Update a cat's information."

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
                remove_owner || remove_cat
                return_to_main?
            when 5
                compare_cats
                return_to_main?
            when 6
                cats_favorite_food
            when 7
                most_cats
                return_to_main?
            when 8
                update_owner_info
                return_to_main?
            when 9
                update_cat_info
                return_to_main?
            else
                puts "Invalid Entry. Please enter a choice 1-9."
                main_menu
        end
    end

    def list_cats
        # lists all known cats and their attributes
        Cat.all
    end

    def list_owners
        # list all known owners and their attributes
        Owner.all
    end

    def add_cat
        puts "ADD A CAT!"
        puts "What is your name?"
            human = gets.chomp
        puts "What is this cat's name?"
            cat_name = gets.chomp
        puts "What color is this cat?"
            cat_color = gets.chomp
        puts "What breed is this cat?"
            cat_breed = gets.chomp
        puts "What is this cat's favorite food?"
            cat_food = gets.chomp
        loop do
            puts "Does this cat get along with other cats? (y/n)"
            cat_temperment = gets.chomp
                if cat_temperment == "y"
                    cat_temperment = true
                    break
                elsif cat_temperment == "n"
                    cat_temperment = false
                    break
                else
                    puts "Please enter y or n."
                end
        end
        
        Owner.create(name: human)
        Cat.create(name: cat_name)
        cat_color = cat_name.color
        cat_breed = cat_name.breed
        cat_food = cat_name.favorite_food
        cat_temperment = cat_name.temperment
    end


end