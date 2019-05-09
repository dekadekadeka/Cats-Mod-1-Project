require 'bundler'
require 'lolize'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
