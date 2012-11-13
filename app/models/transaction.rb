class Transaction < ActiveRecord::Base
  attr_accessible :amount, :deadline, :friend_id, :t_type, :user_id
  
  belongs_to :user
  
  validates :amount, :presence => true
  validates :friend_id, :presence => true
  validates :deadline, :presence => true
  
  TRANSACTION_TYPES = [['Borrow', '1'], ['Lend', '2']]
end
