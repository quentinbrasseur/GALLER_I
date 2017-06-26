class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

helper_method :mailbox, :converatiom#mailboxertest

  private#mailboxertest

  def mailbox#mailboxertest
    @mailbox ||= current_user.mailbox#mailboxertest
  end#mailboxertest
def conversation#mailboxertest
    @conversation ||= mailbox.conversations.find(params[:id])
end#mailboxertest
  protected#mailboxertest

  def configure_permitted_parameters #mailboxertest
    devise_parameter_sanitizer.for(:sign_up) << :name #mailboxertest
    devise_parameter_sanitizer.for(:account_update) << :name#mailboxertest
end#mailboxertest
end
