class User < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  belongs_to :role
 
  validates_presence_of :name
  before_save :assign_role
 
  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
  
  def admin?
    self.role.name == "Admin"
  end
  def writer?
    self.role.name == "Writer"
  end
  def regular?
    self.role.name == "Regular"
  end
end