class Movie < ApplicationRecord
  has_many :comments

  def self.search(dropdown = nil,search = nil)
  if search
    where("#{dropdown} LIKE ?","%#{search}%")
  else
    Movie.all
  end
end

end
