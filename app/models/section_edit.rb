class SectionEdit < ApplicationRecord
  #THis is RICH M:M association. THis model is for the join table btw AdminUser and Section
  belongs_to :admin_user
  belongs_to :section
end
