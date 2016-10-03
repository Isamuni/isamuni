class AdminController < ApplicationController
  layout "user_area"
  before_action :require_admin

  def index
  		@pages = Page.all
	end

  def make_page_inactive
    page = Page.find(params[:pageid])
    page.active = false
    page.save
  end

  def make_page_active
    page = Page.find(params[:pageid])
    page.active = true
    page.save
  end

  def delete_page
    Page.delete(params[:pageid])
  end

  def require_admin
    unless current_user != nil && current_user.is_admin?
      render :file => "public/401.html", :status => :unauthorized
    end
  end

end
