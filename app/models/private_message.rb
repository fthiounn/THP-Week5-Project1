class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :recipient_lists
end
