class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        titleArr = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        found = false
        
        titleArr.map do |p|
            if self.title.to_s.include? p
                found = true
            end
        end

        if not found
            errors.add(:title, "Title is not sufficiently clickbaity, please try another title")
        end
    end
end


# titleArr = ["Won't Belive", "Secret", "Top <number?", "Guess", ]
# if titleArr.include? :title
#     errors.add(:title, "Title is not sufficiently clickbaity, please try another title")
# end