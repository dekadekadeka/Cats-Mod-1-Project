# cats = Cat.all
# owners = Owner.all

# scott = Owner.find_by(name: "Scott")
# deka = Owner.find_by(name: "Deka")

# lemon = Cat.find_by(name: "Lemon")
# paul = Cat.find_by(name: "Paul")

# require_relative '../config/environment'
# require 'tty-prompt'

# prompt = TTY::Prompt.new
# choices = {
#     "  1 - List all of the cats that live in Atlanta." => 1,
#     "  2 - List all of your fellow Atlanta residents." => 2,
#     "  3 - Add your cat to the directory." => 3,
#     "  4 - Remove yourself or your cat from the directory." => 4,
#     "  5 - Compare two cats to see if they'll live harmoniously." => 5,
#     "  6 - See which type of food will attract a certain cat." => 6,
#     "  7 - See which neighbor is the Crazy Cat Lady." => 7,
#     "  8 - Update your information." => 8,
#     "  9 - Update a cat's information." => 9,
#     "  10 - Exit the program" => 10}
# choice = prompt.select("What would you like to do? Scroll to your choice with the arrow keys and then press ENTER.", choices, per_page: 10)

# def add_cat
#     puts "    /\\__/\\"
#     puts "   /'    \'\\"
#     puts " === 0  0 ==="
#     puts "   \\  --  /"
#     puts "  /        \\"
#     puts " /          \\"
#     puts "|            |"
#     puts " \\  ||  ||  /"
#     puts "  \\_oo__oo_/#######o"

#     puts "\nLET'S ADD A FREAKING CAT!"

#     puts "\nWhat is your cat's name?"
#         cat_name = gets.chomp
#     puts "\nWhat color is #{cat_name}?"
#         cat_color = gets.chomp
#     puts "\nWhat breed is #{cat_name}?"
#         cat_breed = gets.chomp
#     puts "\nWhich type of cat food does #{cat_name} prefer? Please enter 'wet' or 'dry'."
#         cat_food = gets.chomp
#     puts "\nDoes #{cat_name} get along with other cats? Please enter 'y' or 'n'."
#         temperament = gets.chomp
#         loop do
#             if temperament == "y"
#                 cat_temperament = true
#             elsif temperament == "n"
#                 cat_temperament = false
#             else
#                 puts "\nPlease enter 'y' or 'n'."
#             end
#         end
#     # Cat.create(name: cat_name, breed: cat_breed, color: cat_color, favorite_food: cat_food, temperament: cat_temperament)
#     loop do
#         puts "\nWould you like to set #{cat_name}'s owner now? (y/n)  Note: you can always edit this later with Main Menu option 9."
#         set_owner = gets.chomp
#             if set_owner == "y"
#                 edit_cat_info
#                 break
#             elsif set_owner == "n"
#                 break
#             else
#                 puts "\nPlease enter 'y' or 'n'."
#             end
#     end
# end




    when 1 #current owner?
    current_owner_loop = true

    puts "\nWhat is the first name of #{kitty_name}'s current owner?"
    new_owner = gets.chomp
    new_owner_id = Owner.all.find_by(name: new_owner)
        if new_owner_id.nil?
            puts "\nThat user doesn't yet exist. You'll now be transferred to the ADD USER menu."
            add_owner
        else
            kitty.owner_id = new_owner_id.id
            puts "\nYay! #{new_owner} is now #{kitty_name}'s owner!\n"
            current_owner_loop = false
        end


