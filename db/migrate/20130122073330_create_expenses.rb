class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :creditor
      t.references :debtor
      t.decimal :money
      t.string :memo

      t.timestamps
    end
    add_index :expenses, :creditor_id
    add_index :expenses, :debtor_id
  end
end
