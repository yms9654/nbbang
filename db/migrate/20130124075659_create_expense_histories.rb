class CreateExpenseHistories < ActiveRecord::Migration
  def change
    create_table :expense_histories do |t|
      t.references :creditor
      t.references :debtor
      t.integer :money
      t.string :memo

      t.timestamps
    end
    add_index :expense_histories, :creditor_id
    add_index :expense_histories, :debtor_id
  end
end
