class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback(feedback)
    @author = feedback.author
    @body = feedback.body

    mail subject: 'User Feedback!'
  end
end
