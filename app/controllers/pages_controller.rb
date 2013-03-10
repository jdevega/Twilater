class PagesController < ApplicationController
  before_filter :user_must_be_logged

  def index
    @page = params[:id] ? Page.find(params[:id]) : current_user.pages.visibles.last 
  end

  def search
    @pages = current_user.pages.visibles.search_full_text(params[:text].to_s)
  end

  def previous
    page = Page.find(params[:id])
    @page = page.previous
    render :index
  end

  def next
    page = Page.find(params[:id])
    @page = page.next
    render :index
  end
end
