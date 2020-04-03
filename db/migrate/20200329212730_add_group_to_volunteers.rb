class AddGroupToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :crew, :integer
  end
end
