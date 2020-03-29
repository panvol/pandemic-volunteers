class AddGroupToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :group, :string
  end
end
