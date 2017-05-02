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

end
