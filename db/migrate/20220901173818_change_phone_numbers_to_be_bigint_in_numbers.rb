class ChangePhoneNumbersToBeBigintInNumbers < ActiveRecord::Migration[7.0]
  def up
    change_column :numbers, :phone_number, :bigint
  end

  def down 
    change_column :numbers, :phone_number, :integer
  end 
end
