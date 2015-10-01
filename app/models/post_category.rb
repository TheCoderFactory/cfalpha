class PostCategory < ActiveRecord::Base
	has_many :posts, dependent: :restrict_with_exception
end
