class ChangeMoneyType < ActiveRecord::Migration
  def up
    change_column :expenses, :money, :integer 
  end

  def down
  end
end
