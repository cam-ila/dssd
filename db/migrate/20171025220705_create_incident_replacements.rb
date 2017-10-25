class CreateIncidentReplacements < ActiveRecord::Migration[5.0]
  def change
    create_table :incident_replacements do |t|
      t.text :description
      t.integer :amount
      t.references :incident
      t.references :replacement

      t.timestamps
    end
  end
end
