class Post < ActiveRecord::Base
  validates :title, presence:true
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"], message: "Invalid Category"}
  validate :clickbait
  validates :content, length: {minimum: 250}


def clickbait
  # binding.pry
   if title != nil && !title.start_with?('Won\'t Believe', 'Secret', 'Top', 'Guess', "You Won\'t")
     errors.add(:title, "Not clickbait title")
   end
 end


end
