class CreateNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :numbers do |t|
      t.integer :phone_number
      t.text :commment
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
