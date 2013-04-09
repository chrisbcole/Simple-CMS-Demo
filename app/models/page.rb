class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :position, :subject_id, :visible
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users
end
