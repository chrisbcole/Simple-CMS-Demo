class AdminUser < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email, :hashed_password, :username, :salt
	has_and_belongs_to_many :pages
	has_many :section_edits
end
