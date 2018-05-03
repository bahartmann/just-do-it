require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "email for task done" do

    let( :user ){ FactoryBot.create :user, email: 'user@mail.com' }
    subject(:mail) { UserMailer.with(user: user).task_done_email.deliver_now }

    it "renders the headers" do
      expect(mail.subject).to eq("You just did it!")
      expect(mail.to).to eq(["user@mail.com"])
      expect(mail.from).to eq(["do-not-reply@justdoit.com"])
    end

    # TODO test helper method call
    it "uses random phrase and color in body" do
      expect(mail.body.encoded).to include("Congratulations")
    end
  end
end
