cats = Cat.all
owners = Owner.all

scott = Owner.find_by(name: "Scott")
deka = Owner.find_by(name: "Deka")

lemon = Cat.find_by(name: "Lemon")
paul = Cat.find_by(name: "Paul")

require_relative '../config/environment'
require 'tty-prompt'

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
    "  10 - Exit the program" => 10}
choice = prompt.select("What would you like to do? Scroll to your choice with the arrow keys and then press ENTER.", choices, per_page: 10)