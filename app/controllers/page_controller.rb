class PageController < ApplicationController
  def home
  end

  def group
    @group = Group.find(params[:id])
  end
end
