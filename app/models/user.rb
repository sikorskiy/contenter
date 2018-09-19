class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessor :name

  belongs_to :user_role
  has_many :camps
  belongs_to :status
  before_validation :default_role


  def is_admin?
    user_role.name == "admin"
  end


  private

  def default_role
    self.user_role ||= UserRole.find_by_name('user')
    self.status ||= Status.first
    self.rating ||= 0
  end

end

