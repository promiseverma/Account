class Account < ActiveRecord::Base
	belongs_to :user

	validates :credit, :numericality => true, :allow_blank => true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/, :message => "should be either numeric or float upto two decimal places." }, :numericality => {:greater_than => 0, :less_than => 1000000}
  validates :debit, :numericality => true, :allow_blank => true, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/, :message => "should be either numeric or float upto two decimal places." }, :numericality => {:greater_than => 0, :less_than => 1000000}
  
  validate :debit_cannot_be_greater_than_available, :if => "credit.nil?"

  after_create :send_email_to_customer

  scope :start, -> (startdate) { where("created_at > ?", Date.parse(startdate)) if startdate.present? }

  scope :end, -> (enddate) { where("created_at < ?", Date.parse(enddate)) if enddate.present? }

  scope :userid, -> (user_ids) { where("user_id IN (?)", user_ids) if user_ids.present? }

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  protected

  def send_email_to_customer
  	UserMailer.transaction_email(self).deliver_now
  end

  def debit_cannot_be_greater_than_available   
    if debit.present? && debit.to_f > (Account.sum(:credit, :conditions => {:user_id => Thread.current[:user].id}) - Account.sum(:debit, :conditions => {:user_id => Thread.current[:user].id}))
      errors.add(:debit, "can't be greater than available balance.")
    end
  end

  
end
