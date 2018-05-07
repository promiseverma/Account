class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:customer, :manager]

  after_initialize :set_default_role, :if => :new_record?

  has_many :accounts

  accepts_nested_attributes_for :accounts, :allow_destroy => true

 

  def set_default_role
    self.role ||= :customer
  end

end
