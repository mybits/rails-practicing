class Comment
	include Mongoid::Document  
	include Mongoid::Timestamps
		
	belongs_to :post
	belongs_to :user
	has_many :votes, dependent: :destroy

	
	field :user, type: String
	field :body, type: String
	field :abusive, type: Boolean, default: false
	
	validates_presence_of :user, :body

end
