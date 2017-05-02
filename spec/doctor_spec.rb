require('spec_helper')

describe(Doctor) do
  describe('#==') do
    it('is the same doctor if it has the same name') do
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
      doctor2 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
        expect(doctor1 == doctor2).to(eq(true))
    end
  end

  describe('#name') do
    it('returns the name of the doctor') do
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
      expect(doctor1.name).to(eq('Michael'))
    end
  end

  describe('#specialty_id') do
    it('returns the specialty id of the doctor') do
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
      expect(doctor1.specialty_id).to(eq(1))
    end
  end

  describe('#id') do
    it('returns the id of the doctor') do
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
      doctor1.save
      expect(doctor1.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".all") do
    it('starts off with no doctors') do
      expect(Doctor.all).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a doctor to the doctors array") do
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
      doctor1.save
      expect(Doctor.all).to(eq([doctor1]))
    end
  end

  describe('#patients') do
    it('returns all patients for a given doctor') do
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => 1, :id => nil})
      doctor1.save
      patient1 = Patient.new({:name => 'Sally', :birthdate => '1990-01-05', :doctor_id => doctor1.id})
      patient1.save
      patient2 = Patient.new({:name => 'Sally', :birthdate => '1990-01-05', :doctor_id => doctor1.id})
      patient2.save
      expect(doctor1.patients).to(eq([patient1, patient2]))
    end
  end
end
