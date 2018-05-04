class UserMailer < ApplicationMailer
  def task_done_email(text, color)
    @user = params[:user]
    @message_text = text
    @message_color = color
    mail(to: @user.email, subject: 'You just did it!')
  end
end
