# cats = Cat.all
# owners = Owner.all

# scott = Owner.find_by(name: "Scott")
# deka = Owner.find_by(name: "Deka")

# lemon = Cat.find_by(name: "Lemon")
# paul = Cat.find_by(name: "Paul")


def edit_cat_info
    puts "\nPlease enter your cat's name and then press the RETURN key."
        kitty_name = gets.chomp
        kitty = Cat.all.find_by(name: kitty_name)



puts "\nPlease enter your cat's name and then press the RETURN key."
kitty_name = gets.chomp
kitty = Cat.all.find_by(name: kitty_name)
    if kitty.nil?
        puts "\nThat meowzer doesn't yet exist. You'll now be transferred to the ADD CAT menu."
        add_cat
    end