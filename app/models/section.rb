class Section < ActiveRecord::Base
  attr_accessible :content_type, :context, :name, :page_id, :position, :visible
end
