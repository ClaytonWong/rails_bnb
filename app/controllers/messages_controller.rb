class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation
    before_action :set_message, only: [:show, :edit, :update, :destroy] 

    def index
        #@message = @conversation.messages.new
        @messages = Message.all
        @message = Message.new
    end

    def new
        #@message = @conversation.messages.new
        @message = Message.new
    end

    def create
        #@message = @conversation.messages.new(message_params)
        #if @message.save
        #    redirect_to conversation_messages_path(@conversation)
        #end
        @message = Message.new(message_params)
        @message.conversation = @conversation
        @message.user = current_user

        respond_to do |format|
            if @message.save
              format.html { redirect_to conversation_messages_url(@conversation), notice: 'Message was successfully created.' }
              format.json { render :show, status: :created, location: @message }
            else
              format.html { render :new }
              format.json { render json: @message.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_message
        @message = Message.find(params[:id])
    end

    def set_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end
    
    def message_params
        params.require(:message).permit(:content, :user_id)
    end
end
