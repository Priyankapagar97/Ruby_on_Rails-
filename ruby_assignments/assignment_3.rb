module ClinicalParson
    attr_accessor :name, :age

    def set_attr(name, age)
        @name = name
        @age = age
    end
end


class Patient
    include ClinicalParson
    @@consented = 0
    @@unconsented = 0
    attr_accessor :email, :contact, :gender, :consent

    def self.consented_patient
        return @@consented
    end

    def self.unconsented_patient
        return @@unconsented
    end

    def self.consent_percentage
        return (@@consented * 100) / (@@unconsented + @@consented)
    end

    def initialize(name, age, email, contact, gender, consent)
        set_attr(name, age)
        @email = email
        @contact = contact
        @gender = gender
        @consent = consent
        if consent == "consented" 
            @@consented++
        else 
            @@unconsented++
        end   
    end

    def eligibility?
        return (self.gender == "male" && self.age >= 12) || (self.gender == "female" && self.age >= 15)
    end
end


class Clinician
    include ClinicalParson

    attr_accessor :speciality, :region, :status

    def initialize(name, age, speciality, region, status = " ")
        set_attr(name, age)
        @speciality = speciality
        @region = region
        @status = status
    end

    def check_status
        if (self.region == "India" && self.speciality != "dentist")
            return "Active"
        else
            return "Inactive"
        end
    end
end

patient_array = [Patient.new("priya", 23, "priya@gmail.com", 9087689087, "female"),Patient.new("aditya", 19, "aditya@gmail.com", 9087689089, "male"),Patient.new("ani", 34, "ani@gmail.com", 9997689087, "female")]

puts "consented patients = #{Patient.consented_patient}"
puts "unconsented patients = #{Patient.unconsented_patient}"
puts "consented percentage = #{Patient.consented_percentage}"
puts "\n"

clini = Clinician.new("clinician_1", 30, "dentist", "India")
puts "Clinician status = #{clini.status}"
