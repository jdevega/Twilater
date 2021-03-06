class PagesController < ApplicationController
  

  def index
    @page = params[:id] ? Page.find(params[:id]) : current_user.pages.visibles.first 
    @readed = @page.readed? if @page
  end

  def dashboard
    @pages = current_user.pages.visibles
  end

  def search
    @pages = current_user.pages.visibles.search_full_text(params[:text].to_s)
  end

  def read
    page = Page.find(params[:id])
    page.mark_as_readed
    render :json => {status: "readed"}
  end

  def delete
    page = Page.find(params[:id])
    page.mark_as_deleted
    render :json => {status: "deleted"}
  end
end
