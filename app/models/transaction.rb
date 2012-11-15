class Transaction < ActiveRecord::Base
  attr_accessible :amount, :deadline, :friend_id, :t_type, :user_id, :status
  
  belongs_to :user
  
  validates :amount, :numericality => { :greater_than_or_equal_to => 0}, :presence => true
  validates :friend_id, :presence => true
  validates :deadline,  :presence => true
  validate  :larger_than_today
  
  TRANSACTION_TYPES = [['Borrow', '1'], ['Lend', '2']]
  TRANSACTION_SITS = [['Open', '0'], ['Close', '1']]
  
  def larger_than_today
    if self.deadline < Date.today
      errors.add :deadline, " should be bigger than today."
    end
  end
end
