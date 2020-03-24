class AddVolunteerFieldDefaults < ActiveRecord::Migration[6.0]
  def change
    change_column_null :volunteers, :name, false
    change_column_null :volunteers, :email, false
    change_column_null :volunteers, :phone, false
    change_column_null :volunteers, :about, false
    change_column_null :volunteers, :country, false
    change_column_null :volunteers, :state, false
    change_column_null :volunteers, :city, false
    change_column_null :volunteers, :immunity, false
    change_column_null :volunteers, :active, false
    change_column_null :volunteers, :assigned, false

    change_column_default :volunteers, :immunity, from: nil, to: false
    change_column_default :volunteers, :assigned, from: nil, to: false
    change_column_default :volunteers, :active, from: nil, to: true
  end
end
