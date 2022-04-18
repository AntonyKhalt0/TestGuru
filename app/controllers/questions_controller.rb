class QuestionsController < ApplicationController
  before_action :find_test

  def index
    render json: { questions: find_questions.all }
  end

  def show
    render json: { questions: find_questions.find(params[:id])}
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
    test = Test.find(params[:test_id])
  end

  def find_questions
    find_test.questions
  end
  
  def question_params
    params.require(:question).permit(:body)
  end
end
