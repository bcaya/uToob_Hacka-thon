class Movie < ApplicationRecord
  has_many :comments

  def self.search(search)
  if search
    where(["title LIKE ?","%#{search}%"])
  else
    Movie.all
  end
end

end
