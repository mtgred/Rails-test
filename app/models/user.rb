class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :department, :role, :office_phone, :mobile_phone, :address, :contractor, :manager_id

  has_many :approvees, :class_name => 'User'
  belongs_to :manager, :class_name => 'User'
  
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def full_name
    "#{first_name} #{last_name}"
  end
end
