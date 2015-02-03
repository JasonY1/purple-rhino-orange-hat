class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  accepts_nested_attributes_for :profile
  
  before_create :build_profile
  
end
