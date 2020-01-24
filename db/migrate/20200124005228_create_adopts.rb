class CreateAdopts < ActiveRecord::Migration[6.0]
  def change
    create_table :adopts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.string :status
      t.string :adopt_date

      t.timestamps
    end
  end
end
