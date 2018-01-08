class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :post, uniqueness: { scope: :user, mesage: "You already liked this post" }
  validates :post, :user, presence: true
end
