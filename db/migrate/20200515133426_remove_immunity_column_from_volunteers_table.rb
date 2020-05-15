class RemoveImmunityColumnFromVolunteersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :volunteers, :immunity, :boolean
  end
end
