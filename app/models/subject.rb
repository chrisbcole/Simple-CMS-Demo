class Subject < ActiveRecord::Base
  attr_accessible :name, :position, :visible

  has_one :page

  # examples of named scopes
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
