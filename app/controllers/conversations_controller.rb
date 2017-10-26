class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
        cg = Conversation.where(guest_id: current_user)
        ch = Listing.where(host_id: current_user)
        @conversations = cg|ch
    end
    
    def show
    end

    def new
        @conversation = Conversation.new
        @params_new = params
    end

    def create
        #byebug
        # Find existing conversations involving current user and current listing
        currrent_user_cons = Conversation.where(guest_id: current_user) 
        current_listing_cons = Conversation.where(listing_id: @listing)
        @con_inter = currrent_user_cons & current_listing_cons
        
        if (@con_inter.empty? == false) 
            set_conversation
        else
            @conversation = Conversation.create!(guest_id: current_user, listing_id: listing)
            #@conversation = Conversation.new(conversation_params)
            #@conversation.guest = current_user
            @listing = Listing.find(params[:conversation][:listing_id])
            #@conversation.listing = Listing.find(params[:listing_id])
            #@conversation = Conversation.new(guest_id: guest, listing_id: @listing)
            respond_to do |format|
                if @conversation.save
                    format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
                    format.json { render :show, status: :created, location: @conversation }
                else
                    format.html { render :new }
                    format.json { render json: @conversation.errors, status: :unprocessable_entity }
                end
            end
        end
        #listing = Listing.where(host_id: host)
        
        #@conversation = Conversation.create!(conversation_params)
        #@message = Message.create!(guest_id: current_user.id, conversation_id: @conversation.id)
        #respond_to do |format|
        #  if @conversation.save
        #    format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        #    format.json { render :show, status: :created, location: @conversation }
        #  else
        #    format.html { render :new }
        #    format.json { render json: @conversation.errors, status: :unprocessable_entity }
        #  end
        #end
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