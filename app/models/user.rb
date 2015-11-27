class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :items
  validates_presence_of :name
  before_save :assign_role
  has_many :users
  def admin?
    self.role.name == "Admin"
  end
  def seller?
    self.role.name == "Seller"
  end
  def regular?
    self.role.name == "Regular"
  end
  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end
end
