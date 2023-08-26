class Catcomment < ApplicationRecord
  belongs_to :article
  belongs_to :catuser
  has_many :reactions, dependent: :destroy
end
