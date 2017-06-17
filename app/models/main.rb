class Main < ApplicationRecord
  acts_as_list

  default_scope -> { order(position: :asc) }

  validates :state, presence: true
end
