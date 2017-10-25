class Addtoreplacement < ActiveRecord::Migration[5.0]
  def change
    add_reference :replacements, :incident, index: true
  end
end
