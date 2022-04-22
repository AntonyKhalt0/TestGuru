module QuestionsHelper
  GIT_URL = 'https://github.com'

  def question_header(test)
    test.title
  end

  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    "#{GIT_URL}/#{author}/#{repo}"
  end
end
