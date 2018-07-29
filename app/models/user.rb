class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :name

  belongs_to :user_role
  before_validation :default_role

  def is_admin?
    user_role.name == "user"
  end


  #validates :quantity, presence: true, numericality: {greater_than: 0}

  private

  def default_role
    self.user_role ||= UserRole.find_by_name('user')
  end

end

