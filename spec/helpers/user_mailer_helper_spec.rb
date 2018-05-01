require "rails_helper"

RSpec.describe UserMailerHelper, type: :helper do
  describe "#congratulation_message" do
    it "returns a random text" do
      possible_phrases = [
        "Yeah! One task done.",
        "Your task is done. Congratulations!",
        "Congratulations, you completed your task!",
        "Be proud! One task done.",
        "Congratulations for a completed task!"
      ]

      text = helper.congratulation_message[:text]
      expect(possible_phrases).to include(text)
    end
  end
end
