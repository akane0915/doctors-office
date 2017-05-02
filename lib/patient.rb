class Patient
attr_reader(:name, :birthdate, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def ==(another_patient)
    self.name == another_patient.name
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch('name')
      birthdate = patient.fetch('birthdate')
      doctor_id = patient.fetch('id').to_i()
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id}))
    end
    patients
  end

  def save
    DB.exec("INSERT INTO patients(name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', #{@doctor_id});")
  end
end
