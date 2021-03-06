class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings, class_name: 'Conversation', foreign_key: 'host_id'
  has_many :conversations, through: :listings
  has_many :conversations
  has_many :messages
end
