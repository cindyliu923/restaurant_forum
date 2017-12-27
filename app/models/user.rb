class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :name  #設定必填
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments

  def admin?
    self.role == "admin"
  end

end
