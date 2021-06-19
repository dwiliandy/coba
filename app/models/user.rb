class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :MataPelajaran, optional: true


  enum role:{
    murid: 0,
    guru: 10,
    admin: 100
  }
  
end
