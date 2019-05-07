namespace :db do
    desc 'migrate changes to your database'
    task :migrate => :environment do
    end
end

task :environment do
    require_relative './config/environment'
  end