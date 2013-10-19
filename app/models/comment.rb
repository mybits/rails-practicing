class Comment
	include Mongoid::Document  
	include Mongoid::Timestamps
	
	belongs_to :post
	belongs_to :user
	has_many :votes

	field :user, type: String
	field :body, type: String

	validates_presence_of :user, :body
end
