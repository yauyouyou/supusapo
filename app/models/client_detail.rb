class ClientDetail < ApplicationRecord
  belongs_to :client
  has_many :fields
  accepts_nested_attributes_for :fields
end
