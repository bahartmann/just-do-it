class UserMailer < ApplicationMailer
  include UserMailerHelper

  def task_done_email
    @user = params[:user]
    @message_text = random_congrats_message
    @message_color = random_color
    mail(to: @user.email, subject: 'You just did it!')
  end
end
