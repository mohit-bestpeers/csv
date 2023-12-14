class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :pushups
      t.integer :situps
      t.integer :steps
      t.integer :pullups

      t.timestamps
    end
  end
end
