class CreateContactDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_details do |t|
      t.string :full_name
      t.string :email_address
      t.string :phone_number

      t.timestamps
    end
  end
end
