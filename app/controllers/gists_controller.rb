class GistsController < ApplicationController
  before_action :set_test_passage

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.present?
      flash[:notice] = "#{t('.success')} #{view_context.link_to('Link to gist', result.html_url, target: '_blank')}"
      gist = Gist.create!(gist_url: result.url, question_id: @test_passage.current_question.id, user_id: @test_passage.user.id)
    else
      flash[:alert] = t('.failure')
    end
    
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
