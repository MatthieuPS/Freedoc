class Appointment < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient
end

# Un rendez-vous appartient à un docteur ;
# Un rendez-vous appartient à un patient ;