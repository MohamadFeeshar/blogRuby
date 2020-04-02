class Post < ApplicationRecord
    has_many :comments
    validates :title, presence:true, uniqueness:true, length:{maximum:50}
    validates :content, presence:true
end
