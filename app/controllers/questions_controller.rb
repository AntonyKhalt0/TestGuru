class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = find_questions
    render json: { questions: @questions }
  end

  def show
    @question = Question.find(params[:id])
    render :show
  end

  def create
    @question = find_questions.build(question_params)
    if @question.save
      redirect_to @question
    else 
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render plain: "Question delete!"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_questions
    @test.questions
  end
  
  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question not found, sorry!"
  end
end
