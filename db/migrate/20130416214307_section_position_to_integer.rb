class SectionPositionToInteger < ActiveRecord::Migration
  def up
  	change_column :sections, :position, :integer
  end

  def down
  	change_column :sections, :position, :string
  end
end
