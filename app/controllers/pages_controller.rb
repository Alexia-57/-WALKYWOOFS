class PagesController < ApplicationController
  def home
    @dogwalks = Dogwalk.all
  end
end
