class UserMailer < ApplicationMailer
  default from: 'do-not-reply@justdoit.com'

  def task_done_mail(user)
      mail(to: user.email, subject: 'You just did it!')
   end
end
