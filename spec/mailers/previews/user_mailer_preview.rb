# Preview all emails at http://localhost:3000/rails/mailers/user_mailer/
class UserMailerPreview < ActionMailer::Preview
  def task_done_email
    user = User.create(name: "Vi", email: "vi@mail.com")
    UserMailer.with(user: user).task_done_email
  end
end
