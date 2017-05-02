class Doctor
  attr_reader(:name, :specialty_id, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty_id = attributes.fetch(:specialty_id)
    @id = attributes.fetch(:id)
  end

  def ==(another_doctor)
    self.name == another_doctor.name
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each do |doctor|
      name = doctor.fetch('name')
      specialty_id = doctor.fetch('specialty_id').to_i
      id = doctor.fetch('id').to_i
      doctors.push(Doctor.new({:name => name, :specialty_id => specialty_id, :id => id}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', #{@specialty_id}) RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  def patients
    list_of_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE doctor_id = '#{self.id}';")
    patients.each do |patient|
      name = patient.fetch('name')
      birthdate = patient.fetch('birthdate')
      doctor_id = patient.fetch('doctor_id').to_i
      list_of_patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id}))
    end
    list_of_patients
  end

  def patient_count
    DB.exec("SELECT COUNT (*) FROM patients WHERE doctor_id = '#{self.id}';").first.fetch('count').to_i
  end
end
