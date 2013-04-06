class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :position, :subject_id, :visible
end
