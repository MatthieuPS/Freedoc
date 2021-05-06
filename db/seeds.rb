# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

doctor_specialities = ["Anatomical Pathology", "Anesthesiology", "Cardiology", "Cardiovascular/Thoracic Surgery", "Clinical Immunology/Allergy", "Critical Care Medicine", "Dermatology", "Diagnostic Radiology", "Emergency Medicine", "Endocrinology and Metabolism", "Family Medicine", "Gastroenterology", "General Internal Medicine", "General Surgery", "General/Clinical Pathology", "Geriatric Medicine", 
    "Hematology", "Nephrology", "Neurology", "Neurosurgery", "Obstetrics/Gynecology", "Ophthalmology", "Orthopedic Surgery", "Pediatrics", "Plastic Surgery", "Psychiatry", "Urology"]
    
    100.times do
      city = City.create!(city_name: Faker::Address.city)
    end
    
    100.times do
      spe = Speciality.create!(speciality: doctor_specialities[rand(doctor_specialities.length)])
    end
    
    100.times do
      city = City.find_by(id: rand(1..City.all.length))
    
      doc = Doctor.create!(first_name: Faker::Name.first_name, 
                            last_name: Faker::Name.last_name,
                            zip_code: Faker::Address.zip_code,
                            city: city)
    end

    100.times do
        spe = Speciality.find_by(id: rand(1..Speciality.all.length))
        doc = Doctor.find_by(id: rand(1..Doctor.all.length))
      
        spe_doc = JoinTableSpecialityDoctor.create!(speciality: spe, 
                                 doctor: doc)
      end
      
      100.times do
        city = City.find_by(id: rand(1..City.all.length))
      
        patient = Patient.create!(first_name: Faker::Name.first_name, 
                              last_name: Faker::Name.last_name,
                              city: city)
      end
      
      loop do
        city_id = rand(1..City.all.length)
        city = City.find_by(id: city_id)
      
        doc_array = Doctor.where(city_id: city_id)
        doc = doc_array[rand(doc_array.length).to_i] 
      
        pat_array = Patient.where(city_id: city_id)
        pat = pat_array[rand(pat_array.length).to_i] 
      
        if doc_array.length != 0 && pat_array.length != 0
          appointment = Appointment.create!(doctor: doc, patient: pat, city: city, date: Faker::Date.forward(days: 60))
        end
        
        break if Appointment.count == 100
      end