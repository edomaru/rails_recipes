class Chef < ActiveRecord::Base
	validates :chefname, presence: true, length: { minimum: 3, maximum: 40 }
	validates :email, presence: true
end
