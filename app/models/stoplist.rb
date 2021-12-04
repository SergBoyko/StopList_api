class Stoplist < ApplicationRecord
  #TODO Make validation by regexp
  validates :phone, presence: true, length: {maximum: 15}
end
