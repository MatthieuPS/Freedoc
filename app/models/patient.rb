class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments
end

# Un patient peut avoir plusieurs rendez-vous ;
# Un patient peut avoir plusieurs docteurs, à travers les rendez-vous.