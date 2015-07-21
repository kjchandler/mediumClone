class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :posts, :through => :user

	has_attached_file :avatar, :styles => { :large => "600x600", :medium => "300x300", :thumb => "100x100>"}
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :username, :avatar, :presence => true
	validates :username, length: {
		minimum: 2,
		maximum: 15
	}
end
