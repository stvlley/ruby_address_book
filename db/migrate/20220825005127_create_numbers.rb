class CreateNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :numbers do |t|
      t.integer :phone_number
      t.text :comment
      t.belongs_to :people, index: true, foreign_key: true
      t.timestamps
    end
  end
end
