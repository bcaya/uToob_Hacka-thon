class Comment < ApplicationRecord
  belongs_to :User
  belongs_to :Movie
end
