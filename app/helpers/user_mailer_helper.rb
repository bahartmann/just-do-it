module UserMailerHelper

  def random_congrats_message
    CONGRATULATION_MSGS.sample
  end

  def random_color
    COLORS.sample
  end

  CONGRATULATION_MSGS = [
    "Yeah! One task done.",
    "Your task is done. Congratulations!",
    "Congratulations, you completed your task!",
    "Be proud! One task done.",
    "Congratulations for a completed task!"
  ]

  COLORS = [
    "#007bff",
    "#28a745",
    "#dc3545",
    "#ffc107",
    "#17a2b8"
  ]
end
