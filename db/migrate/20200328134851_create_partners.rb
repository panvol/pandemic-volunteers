class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.integer :type
      t.string :country
      t.string :state
      t.string :city
      t.text :about
      t.timestamps
    end

    create_table :partner_staffs do |t|
      t.integer :partner_id
      t.string :name
      t.string :email
      t.text :about
      t.boolean :active, default: true
    end
  end
end
