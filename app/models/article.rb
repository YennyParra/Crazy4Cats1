class Article < ApplicationRecord
  belongs_to :aventure
  has_many :catcomments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :catuser, through: :reactions


  Kinds = %w[like dislike not_interested neutral].freeze
  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta",
  "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze
  
end
