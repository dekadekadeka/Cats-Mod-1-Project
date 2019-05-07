require 'active_record'
require 'require_all'
require 'sqlite3'
require 'rake'

require_all "./app"

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => "db/cats.sqlite"
)

require 'logger'
ActiveRecord::Base.logger = Logger.new(STDOUT)