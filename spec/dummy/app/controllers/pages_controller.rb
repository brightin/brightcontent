class PagesController < ApplicationController
  def index
  end

  def show
    render text: current_page.name
  end
end
