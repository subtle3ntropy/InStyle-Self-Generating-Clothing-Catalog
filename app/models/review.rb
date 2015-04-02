class Review < ActiveRecord::Base
	acts_as_votable

	belongs_to :user
	belongs_to :product
	has_many :comments
	def score
		self.get_upvotes.size 
	end
	
end
