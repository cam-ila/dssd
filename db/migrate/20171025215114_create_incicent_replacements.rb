class CreateIncicentReplacements < ActiveRecord::Migration[5.0]
  def change
    create_table :incicent_replacements do |t|
      t.text :description
      t.integer :amount

      t.timestamps
    end
  end
end
