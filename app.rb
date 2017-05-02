require 'sinatra'
require 'sinatra/reloader'
require './lib/doctor'
require './lib/patient'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'doctors_office'})

get('/') do
  erb(:index)
end
