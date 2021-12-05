class Stoplist < ApplicationRecord
  validates :phone, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: /\A(\+|\d)\d+/, message: "Only phone nomber" }
end
