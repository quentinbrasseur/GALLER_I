class ConversationsController < ApplicationController
 before_action :authenticate_user!

  def new

end

def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"

    redirect_to profile_path(current_user)

  end

def send_mailer
 # @current_user = current_user.email
@user = User.find(params[:id]) #params[:user_email]
@appointment = Appointment.last
@recipient = @user.first_name
@title = @appointment.artwork.title
@category = @appointment.artwork.category
@venue = @appointment.venue.title
@type = @appointment.venue.category
@requester = current_user.first_name
@start = @appointment.start_date
@end = @appointment.end_date
@message = "Good day #{@recipient}, my name is #{@requester}.  I would like to display your #{@category}: #{@title} in a #{@type} called #{@venue}.  If you are interested, please click below to confirm or decline the show request.  If you have any questions at all, just reply to this message.  I eagerly await your reply.  Sincerely, #{@requester} ".html_safe
 @subject = "#{@requester} from #{@venue} wants to display your #{@category}: #{@title} from #{@start} to #{@end}." #params[:subject]
current_user.send_message(@user, "#{@message}", "#{@subject}")
redirect_to profile_path(current_user)
end

def accepted
 # @current_user = current_user.email
@user = User.find(params[:id]) #params[:user_email]

@message = "Good day #{@user.first_name}, I would love to support your request!  Please reply to this message to coordinate details".html_safe
 @subject = "#{@user.first_name}, your booking request has been confirmed!" #params[:subject]
current_user.send_message(@user, "#{@message}", "#{@subject}")
redirect_to profile_path(current_user)
end

def declined
 # @current_user = current_user.email
@user = User.find(params[:id]) #params[:user_email]

@message = "Good day #{@user.first_name}, I appologise, but I cannot support your request at the time.  Thank you for your understanding!".html_safe
 @subject = "#{@user}, your booking request has been declined :(" #params[:subject]
current_user.send_message(@user, "#{@message}", "#{@subject}")
redirect_to profile_path(current_user)
end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
end

def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
end
def message_params
    params.require(:message).permit(:body, :subject)
end

end
