class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :immunity
      t.text :about
      t.string :country
      t.string :state
      t.string :city
      t.boolean :active
      t.boolean :assigned

      t.timestamps
    end
  end
end
