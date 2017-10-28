class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
        # Retrive conversations where the guest is the current user
        cg = Conversation.where(guest: current_user)
        # Get listings where the host is the current user
        cl = Listing.where(host: current_user)
        # Get conversations where the listing has current user as the host
        ch = Conversation.where(listing: cl)
        # Get conversations that involve current user        
        @conversations = cg|ch
    end
    
    def show
        redirect_to conversation_messages_path(@conversation)
    end

    def new
        @conversation = Conversation.new
        @params_new = params
    end

    def create
        
        # Find existing conversations involving current user and current listing
        cg = Conversation.where(guest_id: current_user) 
        cl = Conversation.where(listing_id: params[:conversation][:listing_id])
        @con_inter = cg & cl
        
        if (@con_inter.empty? == false)
            # If conversations involving current user & current listing exists,
            # then go to the first one
            @conversation = @con_inter.first
        else
            # Create a new conversation
            @conversation = Conversation.create!(conversation_params)
        end
        redirect_to conversation_messages_path(@conversation)
    end
    
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
        @conversation = Conversation.find(params[:id])
    end

    def conversation_params
        params.require(:conversation).permit(:guest_id, :listing_id)
    end
end