# coding: utf-8

class QiupinController < ApplicationController
  menu_nav_highlight :nav_qiupin
  before_filter :is_authorize, :only => ['new', 'create', 'comment_create']

  def index
    @qiupins = Qiupin.checked.order('id desc').paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @qiupin = Qiupin.find(params[:id])
    @comment = Comment.new
    @seo_title = "#{@qiupin.title} - 泸州拼客网"
    @seo_description = " #{@qiupin.body[0..100]}"
  end

  def new
    @qiupin = Qiupin.new()
  end

  def create
    @qiupin = Qiupin.new(params[:qiupin])
    @qiupin.user = current_user
    respond_to do |format|
      if @qiupin.save
        format.html {redirect_to qiupin_path(@qiupin)}
      else
        format.html {render :action => :new}
      end
    end
  end

  def comment_create

    require "pp"
    pp "--------------------"
    pp @comment
    @qiupin = Qiupin.find(params[:id])
    @comment = @qiupin.comments.new(params[:comment])
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
   @qiupin = Qiupin.find(params[:id])
   @comment = Comment.new
   respond_to do |format|
     format.html
     format.js
   end
  end

  def filter
    @param = params[:qiupin]
    @qiupins = Qiupin.checked
    @qiupins = @qiupins.where(:des_province => @param[:des_province]) if !@param[:des_province].blank?
    @qiupins = @qiupins.where(:des_city => @param[:des_city]) if !@param[:des_city].blank?
    @qiupins = @qiupins.where(:des_county => @param[:des_county]) if !@param[:des_county].blank?
    @qiupins = @qiupins.order('id desc').paginate(:page => params[:page], :per_page => 30)
  end


end
