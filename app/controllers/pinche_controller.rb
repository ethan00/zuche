# coding: utf-8

class PincheController < ApplicationController
  menu_nav_highlight :nav_pinche

  before_filter :is_authorize, :only => ['new', 'create', 'comment_create']

  def index
    @pinches = Pinche.checked.order('set_top').order('id desc').paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @pinche = Pinche.find(params[:id])
    @comment = Comment.new
    @seo_title = "#{@pinche.title} - 泸州拼客网"
    @seo_description = "#{@pinche.car_info}途经#{@pinche.way}拼#{@pinche.person}人, #{@pinche.body[0..100]}"

#    Notifier.sendmail("wangyu_fine@sina.com", "the test", @pinche.title).deliver
  end

  def new
    @pinche = Pinche.new()


  end

  def create
    @pinche = Pinche.new(params[:pinche])
    @pinche.user = current_user
    respond_to do |format|
      if @pinche.save
        format.html {redirect_to pinche_path(@pinche)}
      else
        format.html {render :action => :new}
      end
    end

  end

  def comment_create
    @pinche = Pinche.find(params[:id])
    @comment = @pinche.comments.new(params[:comment])
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
    @pinche = Pinche.find(params[:id])
    @comment = Comment.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def filter
    @param = params[:pinche]
    @pinches = Pinche.checked
    @pinches = @pinches.where(:des_province => @param[:des_province]) if !@param[:des_province].blank?
    @pinches = @pinches.where(:des_city => @param[:des_city]) if !@param[:des_city].blank?
    @pinches = @pinches.where(:des_county => @param[:des_county]) if !@param[:des_county].blank?
    @pinches = @pinches.where(:car_info => @param[:car_info]) if @param[:car_info] != "不限"
    @pinches = @pinches.order('id desc').paginate(:page => params[:page], :per_page => 30)
  end


end
