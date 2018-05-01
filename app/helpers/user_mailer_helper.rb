module UserMailerHelper

  def congratulation_message
    { text: CONGRATULATION_MSGS.sample }
  end

  CONGRATULATION_MSGS = [
    "Yeah! One task done.",
    "Your task is done. Congratulations!",
    "Congratulations, you completed your task!",
    "Be proud! One task done.",
    "Congratulations for a completed task!"
  ]
end
