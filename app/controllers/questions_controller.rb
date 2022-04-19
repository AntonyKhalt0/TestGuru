class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = find_questions
    render json: { questions: @questions }
  end

  def show
    @questionss = Question.find(params[:id])
    render plain: @questionss.inspect
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @question
    else 
      render :new
    end
  end

  def destroy
    find_questions.find(params[:id]).destroy
    redirect_to :index
  end

  private

  def find_test
    @test_id = params[:id]
    @test = Test.find(@test_id)
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
