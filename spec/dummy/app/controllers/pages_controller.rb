class PagesController < ApplicationController
  def index
    render text: current_page.name
  end

  def show
    render text: current_page.name
  end
end
