require('spec_helper')

describe(Patient) do
  describe('#==') do
    it('is the same patient if it has the same name') do
      patient1 = Patient.new({:name => 'Sally', :birthdate => 1990-01-05, :doctor_id => 1})
      patient2 = Patient.new({:name => 'Sally', :birthdate => 1990-01-05, :doctor_id => 1})
      expect(patient1 == patient2).to(eq(true))
    end
  end

  describe('#name') do
    it('returns the patients name') do
      patient1 = Patient.new({:name => 'Sally', :birthdate => 1990-01-05, :doctor_id => 1})
      expect(patient1.name).to(eq('Sally'))
    end
  end

  describe('#birthdate') do
    it('returns the patients birthdate') do
      patient1 = Patient.new({:name => 'Sally', :birthdate => 1990-01-05, :doctor_id => 1})
      expect(patient1.birthdate).to(eq(1990-01-05))
    end
  end

  describe('#doctor_id') do
    it('returns the patients doctor_id') do
      patient1 = Patient.new({:name => 'Sally', :birthdate => 1990-01-05, :doctor_id => 1})
      expect(patient1.doctor_id).to(eq(1))
    end
  end
end
