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
end
