class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.feedback(@feedback).deliver_now
      redirect_to tests_path
    else
      render :new
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:author, :body)
    end
end
