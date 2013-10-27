class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  has_and_belongs_to_many :groups
  has_many :meetings, :through => :groups

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    last_name + ", " + first_name
  end

  def is_admin?
    self.admin == true
  end

  def health_pro?
    self.role == 1
  end

end
