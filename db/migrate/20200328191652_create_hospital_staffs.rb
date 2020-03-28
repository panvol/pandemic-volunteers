class CreateHospitalStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :hospital_staffs do |t|
      t.integer :hospital_id
      t.string :email
      t.string :name
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
