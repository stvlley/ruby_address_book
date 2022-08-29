class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :person, null: false, foreign_key: true
      t.string :street, null: false
      t.string :town, null: false
      t.integer :zipcode, null: false
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
