class Bathroom < ApplicationRecord
    has_many :movements
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?

end
