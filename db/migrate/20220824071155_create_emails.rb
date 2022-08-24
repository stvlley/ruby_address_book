class CreateEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :email_address
      t.text :comment
      t.timestamps
    end
  end
end
