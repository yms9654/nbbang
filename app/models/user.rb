class User < ActiveRecord::Base
  has_many :credits, :class_name => "Expense", :foreign_key => :creditor_id
  has_many :debts, :class_name => "Expense", :foreign_key => :detor_id
  attr_accessible :account_no, :bank, :email, :name
end
