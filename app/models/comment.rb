class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :item

    validates :comment, precense: true
end
