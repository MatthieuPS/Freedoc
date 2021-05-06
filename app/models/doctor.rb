class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
end

#Un docteur peut avoir plusieurs rendez-vous ;
#Un docteur peut avoir plusieurs patients, à travers les rendez-vous ;