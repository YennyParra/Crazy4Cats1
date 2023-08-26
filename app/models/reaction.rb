class Reaction < ApplicationRecord
  belongs_to :article, optional: true
  belongs_to :catuser
  belongs_to :catcomment, optional: true
end
