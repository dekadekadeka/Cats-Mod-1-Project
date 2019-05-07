class DirectoryController

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
        when 2
            list_owners
        when 3
            add_cat
        when 4
            remove_owner || remove_cat
        when 5
            compare_cats
        when 6
            cats_favorite_food
        when 7
            most_cats
        when 8
            update_owner_info
        when 9
            update_cat_info
        else
            puts "Invalid Entry. Please enter a choice 1-9."
            main_menu
    end

    
end