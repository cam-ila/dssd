class AddUserIdToIncident < ActiveRecord::Migration[5.0]
  def change
    add_reference :incidents, :user, foreign_key: true
  end
end
