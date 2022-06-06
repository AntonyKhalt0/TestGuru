class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      create_gist 
      flash[:notice] = "#{t('.success')} #{@result.url}" 
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def create_gist
    current_user.gists.build(gist_url: @result.url, question: @test_passage.current_question, user: @test_passage.user).save
  end
end
