class Conversation < ApplicationRecord
  belongs_to :guest, :class_name => User
  belongs_to :listing
  has_many :messages, dependent: :destroy
end