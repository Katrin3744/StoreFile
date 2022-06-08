class TextFile < ApplicationRecord
  include PgSearch::Model
  include Encryption::Crypto

  has_one_attached :txt_file

  validates :description, presence: true
  before_validation :set_description

  pg_search_scope :search_everywhere, against: [:description]

  def encrypt_text_file
    encrypt(txt_file)
  end

  private

  def set_description
    self.description = txt_file.blob.filename
  end
end
