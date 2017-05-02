require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new specialty', {:type => :feature}) do
  it ('allows a user to add a new specialty') do
    visit('/')
    click_link('Add New Specialty')
    fill_in('description', :with => 'Pediatrics')
    click_button('Add Specialty')
    expect(page).to have_content('You have added a specialty!')
  end
end

describe('viewing all of the specialties', {:type => :feature}) do
  it ('allows a user to see all of the specialties') do
    specialty = Specialty.new({:description => 'Pediatrics', :id => nil})
    specialty.save
    visit('/')
    click_link('View All Specialties')
    expect(page).to have_content(specialty.description)
  end
end

describe('viewing the list of doctors for a single specialty', {:type => :feature}) do
  it('allows a user to see all of the doctors with a given specialty') do
    specialty = Specialty.new({:description => 'Pediatrics', :id => nil})
    specialty.save
    doctor= Doctor.new({:name => 'Michael', :specialty_id => specialty.id, :id => nil})
    doctor.save
    visit('/specialties')
    click_link(specialty.description)
    expect(page).to have_content(doctor.name)
  end
end

describe('adding a doctor to a specialty', {:type => :feature}) do
  it('allows a user to add a doctor to a specialty') do
    specialty = Specialty.new({:description => 'Pediatrics', :id => nil})
    specialty.save
    visit("/specialties/#{specialty.id}")
    fill_in("name", {:with => "Michael"})
    click_button("Add doctor")
    expect(page).to have_content("You have added a doctor!")
  end
end
