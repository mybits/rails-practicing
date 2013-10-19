class Comment
	include Mongoid::Document  
	include Mongoid::Timestamps
	
	embedded_in :post, inverse_of: :comments
	belongs_to :user

	field :author, type: String
	field :body, type: String

	validates_presence_of :author, :body
end
