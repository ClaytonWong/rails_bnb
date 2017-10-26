class Conversation < ApplicationRecord
  belongs_to :guest, :class_name => User
  belongs_to :listing
  has_many :messages, dependent: :destroy

  validates_uniqueness_of :guest
  # Create a scope validation, “between,” which takes the guest_id and host_id of the listing for the conversation and checks whether a conversation exists between these two ids because we only want two users to have one conversation. 
  #-> (guest_id,listing.host_id) do 
  #scope :between, -> { where(“(conversations.guest_id = ? AND conversations.listing.host_id =?) OR (conversations.guest_id = ? AND conversations.listing.host_id =?)”, guest_id, listing.host_id, listing.host_id, guest_id)}
  #end
end