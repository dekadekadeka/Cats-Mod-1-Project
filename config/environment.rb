require 'active_record'
require 'require_all'
require 'sqlite3'

require_all "./app"

ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3',
  :database => "db/cats.sqlite"
})