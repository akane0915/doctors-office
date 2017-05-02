require 'sinatra'
require 'sinatra/reloader'
require './lib/doctor'
require './lib/patient'
require './lib/specialty'
require 'pry'
require 'pg'

also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'doctors_office_test'})

get('/') do
  erb(:index)
end

get('/specialties/new') do
  erb(:specialty_form)
end

post('/specialties') do
  description = params.fetch('description')
  specialty = Specialty.new({:description => description, :id => nil})
  specialty.save
  erb(:specialty_success)
end

get('/specialties') do
  @specialties = Specialty.all
  erb(:specialties)
end

get('/specialties/:id') do
  @specialty = Specialty.find(params.fetch('id').to_i)
  erb(:specialty)
end

post('/doctors') do
  name = params.fetch('name')
  specialty_id = params.fetch('specialty_id').to_i
  @specialty = Specialty.find(specialty_id)
  @doctor = Doctor.new({:name => name, :specialty_id => specialty_id, :id => nil})
  @doctor.save
  erb(:doctor_success)
end
