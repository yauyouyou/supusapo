class ClientDetail < ApplicationRecord
  belongs_to :client
  belongs_to :user

  validates :title, presence: true
end
