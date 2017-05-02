class Specialty
  attr_reader(:description, :id)

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  def ==(another_specialty)
    self.description == another_specialty.description
  end

  def self.all
    returned_specialties = DB.exec('SELECT * FROM specialties;')
    specialties = []
    returned_specialties.each do |specialty|
      description = specialty.fetch('description')
      id = specialty.fetch('id').to_i
      specialties.push(Specialty.new({:description => description, :id => id}))
    end
    specialties
  end

  def save
    result = DB.exec("INSERT INTO specialties (description) VALUES ('#{@description}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def doctors
    returned_doctors = DB.exec("SELECT * FROM doctors WHERE specialty_id = '#{self.id}' ORDER BY name; ")
    list_of_doctors = []
    returned_doctors.each do |doctor|
      name = doctor.fetch('name')
      specialty_id = doctor.fetch("specialty_id").to_i
      id = doctor.fetch('id').to_i
      list_of_doctors.push(Doctor.new({:name => name, :specialty_id => specialty_id, :id => id}))
    end
  list_of_doctors
  end
end
