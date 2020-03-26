class OptionalVolunteerLocation < ActiveRecord::Migration[6.0]
def change
    change_column_null :volunteers, :country, true
    change_column_null :volunteers, :state, true
    change_column_null :volunteers, :city, true
  end
end
