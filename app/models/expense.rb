class Expense < ActiveRecord::Base
  belongs_to :creditor, :class_name => "User", :foreign_key => :creditor_id
  belongs_to :debtor, :class_name => "User", :foreign_key => :debtor_id
  attr_accessible :creditor_id, :debtor_id, :memo, :money
end
