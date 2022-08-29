class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.references :person, null: false, foreign_key: true
      t.string :email, null: false
      t.text :comment
      t.timestamps
    end
  end
end
