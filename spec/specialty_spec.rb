require('spec_helper')

describe(Specialty) do
  describe('#description') do
    it('will return the description of the specialty') do
      specialty1 = Specialty.new({:description => 'Pediatrics', :id => nil})
      expect(specialty1.description).to(eq('Pediatrics'))
    end
  end

  describe('#id') do
    it('will return the id of the specialty') do
      specialty1 = Specialty.new({:description => 'Pediatrics', :id => nil})
      specialty1.save
      expect(specialty1.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it('is the same specialty if it has the same description') do
      specialty1 = Specialty.new({:description => 'Pediatrics', :id => nil})
      specialty2 = Specialty.new({:description => 'Pediatrics', :id => nil})
      expect(specialty1 == specialty2).to(eq(true))
    end
  end

  describe(".all") do
    it('starts off with no specialties') do
      expect(Specialty.all).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a specialty to the specialty array") do
      specialty1 = Specialty.new({:description => 'Pediatrics', :id => nil})
      specialty1.save
      expect(Specialty.all).to(eq([specialty1]))
    end
  end

  describe('#doctors') do
    it('returns all doctors for a given specialty in alphabetical order') do
      specialty1 = Specialty.new({:description => 'Pediatrics', :id => nil})
      specialty1.save
      doctor1 = Doctor.new({:name => 'Michael', :specialty_id => specialty1.id, :id => nil})
      doctor1.save
      doctor2 = Doctor.new({:name => 'Cynthia', :specialty_id => specialty1.id, :id => nil})
      doctor2.save
      expect(specialty1.doctors).to(eq([doctor2, doctor1]))
    end
  end
end
