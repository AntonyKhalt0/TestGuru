class GitHubClient
  #ROOT_ENDPOINT = 'https://api.github.com'.freeze
  #ACCESS_TOKEN = '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'.freeze
  
  ACCESS_TOKEN = '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'.freeze

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params.to_json)
  end

  private

  def setup_http_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
  end
end
