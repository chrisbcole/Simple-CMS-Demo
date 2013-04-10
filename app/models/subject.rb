class Subject < ActiveRecord::Base
  attr_accessible :name, :position, :visible

  has_many :pages

  validates_presence_of :name
  validates_length_of :name, :maximum => 255

  # examples of named scopes
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
