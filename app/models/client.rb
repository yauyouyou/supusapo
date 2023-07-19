class Client < ApplicationRecord
  has_many :client_details

  validates :client_firstname, presence: true
  validates :client_firstname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :client_lastname, presence: true
  validates :client_lastname, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :client_firstname_kana, presence: true
  validates :client_firstname_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :client_lastname_kana, presence: true
  validates :client_lastname_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :birthday, presence: true
  validates :gender_id, presence: true, exclusion: { in: [1] }
  validates :post_code, presence: true
  validates :post_code,format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format of 3 digits, hyphen, and 4 digits' }
  validates :prefecture_id, presence: true, exclusion: { in: [1] }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :phone_number,format: { with: /\A[0-9]{10,11}\z/, message: 'must be 10 to 11 digits and contain only numbers' }
  validates :mobile_number,format: { with: /\A[0-9]{10,11}\z/, message: 'must be 10 to 11 digits and contain only numbers' }
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
