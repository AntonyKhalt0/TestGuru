class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = find_questions.all
    render json: { questions: @questions }
  end

  def show
    @question = find_questions.find(params[:id])
    render json: { questions: @question }
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    find_questions.find(params[:id]).destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_questions
    find_test.questions
  end
  
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found, sorry!"
  end
end
