class Client < ApplicationRecord
  validates :client_firstname, presence: true
  validates :client_lastname, presence: true
  validates :client_firstname_kana, presence: true
  validates :client_lastname_kana, presence: true
  validates :birthday, presence: true
  validates :gender_id, presence: true, exclusion: { in: [1] }
  validates :post_code, presence: true
  validates :prefecture_id, presence: true, exclusion: { in: [1] }
  validates :municipality, presence: true
  validates :address, presence: true
  # validates :building_name
  # validates :phone_number
  # validates :mobile_number
  # validates :company_name
  # validates :project
  # validates :note



  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :gender
end
