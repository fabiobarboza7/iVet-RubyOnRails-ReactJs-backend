class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.datetime :birthday
      t.references :animal_type, null: false, foreign_key: true
      t.string :location
      t.string :details
      t.string :photo
      t.string :status

      t.timestamps
    end
  end
end
