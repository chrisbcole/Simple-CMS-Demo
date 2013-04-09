class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :position, :subject_id, :visible
  belongs_to :subject
  has_many :sections
end
