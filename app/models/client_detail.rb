class ClientDetail < ApplicationRecord
  belongs_to :client

  validates :title, presence: true
end
