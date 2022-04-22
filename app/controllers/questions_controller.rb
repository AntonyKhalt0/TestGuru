class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :new, :create, :update]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = find_questions
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path(@test)
    else 
      render :show
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = find_questions.build(question_params)
    if @question.save
      redirect_to test_questions_path(@test)
    else 
      render :new
    end
  end

  def destroy
    @test = Test.find(@question.test_id)
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_questions
    @test.questions
  end
  
  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: "Question not found, sorry!"
  end
end
