# frozen_string_literal: true

module QuestionsHelper
  GIT_URL = 'https://github.com'

  def question_header(test, action)
    case action
    when 'create'
      "Create New #{test.title} Question"
    when 'edit'
      "Edit #{test.title} Question"
    else
      'Unknown action'
    end
  end

  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    url = "#{GIT_URL}/#{author}/#{repo}".freeze
    link_to('Test Guru', url, html_options = { target: '_blank', rel: 'nofollow noopener' })
  end
end
