class CreateIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :incidents do |t|
      t.integer :client_number
      t.string :incident_type
      t.text :description
      t.string :state

      t.timestamps
    end
  end
end
