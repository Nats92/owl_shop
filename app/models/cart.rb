class Cart < ApplicationRecord

  belongs_to :user, optional: true
  has_many   :positions
  has_many   :items, through: :positions

end
