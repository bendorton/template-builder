class ProfileDatum < ApplicationRecord
  belongs_to :profile
  belongs_to :profile_section
end
