require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "email for task done" do

     let( :user ){ FactoryBot.create :user, email: 'user@mail.com' }
     let( :mail ){ UserMailer.task_done_mail(user).deliver_now }

     it "renders the headers" do
      expect(mail.subject).to eq("You just did it!")
      expect(mail.to).to eq(["user@mail.com"])
      expect(mail.from).to eq(["do-not-reply@justdoit.com"])
     end
  end
end
