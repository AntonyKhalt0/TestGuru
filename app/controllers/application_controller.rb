class ApplicationController < ActionController::Base
  def about
    render "layouts/about"
  end

  def author
    render "layouts/author"
  end
end
