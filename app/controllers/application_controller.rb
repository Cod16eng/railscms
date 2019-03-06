class ApplicationController < ActionController::Base
  before_action :getPageNav, :getJumbotron, :getBlock

  protect_from_forgery with: :exception


  def getPageNav

  	@pageNav = Page.where(:menu_display => true, :is_published => true).order(order: :asc)
  	
  end

  def getJumbotron
  	@jumbotron =Block.where(:position => "jumbotron")
  end

  def getBlock
  	@blocks =Block.where(:position => "block").order(order: :asc)
  end
end
