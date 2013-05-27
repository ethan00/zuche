# coding: utf-8
class RentController < ApplicationController
  menu_nav_highlight :nav_rent
  before_filter :is_authorize, :only => ['new', 'create', 'comment_create']
  def index
    @rents = Rent.checked.order('id desc').paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @rent = Rent.find(params[:id])
    @comment = Comment.new
    @seo_title = "#{@rent.title} - 泸州拼客网"
    @seo_description = "#{@rent.car_info}, #{@rent.body[0..100]}"
  end

  def new
    @rent = Rent.new()
  end

  def create
    @rent = Rent.new(params[:rent])
    @rent.user = current_user
    respond_to do |format|
      if @rent.save
        format.html {redirect_to rent_path(@rent)}
      else
        format.html {render :action => :new}
      end
    end

  end

  def comment_create
    @rent = Rent.find(params[:id])
    @comment = @rent.comments.new(params[:comment])
    @comment.user = current_user
    respond_to do |format|
      if !(captcha_valid? params[:captcha])
        format.js { render :partial => 'error_captcha' }
      elsif captcha_valid? params[:captcha] and @comment.save

        format.js
      end
    end
  end

  def change_captcha
    @rent = Rent.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end


end
