class PagesController < ApplicationController
  def index
  end

  def show
    render plain: current_page.name
  end
end
