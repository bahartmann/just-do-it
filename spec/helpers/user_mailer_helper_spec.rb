require "rails_helper"

RSpec.describe UserMailerHelper, type: :helper do
  describe "#random_congrats_message" do
    it "returns a random text" do
      possible_phrases = [
        "Yeah! One task done.",
        "Your task is done. Congratulations!",
        "Congratulations, you completed your task!",
        "Be proud! One task done.",
        "Congratulations for a completed task!"
      ]

      text = helper.random_congrats_message
      expect(possible_phrases).to include(text)
    end
  end

  describe "#random_color" do
    it "returns a random color" do
      possible_colors = [
        "#007bff",
        "#28a745",
        "#dc3545",
        "#ffc107",
        "#17a2b8"
      ]

      color = helper.random_color
      expect(possible_colors).to include(color)
    end
  end
end
