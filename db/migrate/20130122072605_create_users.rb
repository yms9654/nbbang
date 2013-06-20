class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :bank
      t.string :account_no

      t.timestamps
    end
  end
end
