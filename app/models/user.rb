class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :credits, :class_name => "Expense", :foreign_key => :creditor_id
  has_many :debts, :class_name => "Expense", :foreign_key => :detor_id
  attr_accessible :account_no, :bank, :email, :name
end
