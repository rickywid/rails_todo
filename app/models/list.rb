class List < ActiveRecord::Base
	has_many :tasks
	
	validates :title, presence: { message: "needs to be entered for you new list" }

end
