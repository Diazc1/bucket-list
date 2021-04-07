ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'dotenv/load'
require 'rack-flash'


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite3"
)

require './app/controllers/application_controller'
require_all 'app'


ActiveRecord::Base.logger = Logger.new(STDOUT)