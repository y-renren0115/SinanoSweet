class Address < ApplicationRecord
  belongs_to :end_user
 
 def address_info_merge
    self.postcode + " " + self.address + " " + self.name
  end
end
