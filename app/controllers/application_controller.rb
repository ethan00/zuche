# coding: utf-8
class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!
  before_filter :set_seo

  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    render :text => "权限不足"
  end

  def self.menu_nav_highlight(name)
    class_eval do
      before_filter { |c| c.instance_variable_set(:@menu_nav, name) }
    end
  end

  def authorize_namespace
    options = self.class_attribute(:authorize_namespace)
    authorize!(params[:action].to_sym, options[:namespace])
  end

  def self.authorize_namespace(options = {})
    before_filter(:authorize_namespace, options.slice(:only, :except))
    class_attribute :authorize_namespace
    self.authorize_namespace = options
  end



  def is_authorize

    if current_user.blank?
      #redirect_to new_user_session_url
      current_user = User.find_by_email("1554882772@qq.com")
    end
  end

  def set_seo
    @seo_title = "『泸州拼车信息|泸州租车信息|泸州汽车维修信息|泸州代驾信息|泸州二手汽车信息』 - 泸州拼客网"
    @seo_keywords = "泸州拼车|泸州租车|泸州汽车维修|泸州汽车养护|泸州代驾|泸州二手汽车"
    @seo_description = "泸州拼车网，为您提供大量泸州本地的拼车信息，在这里您还可以免费查看和发布泸州的拼车，租车，汽修，二手车转让等信息，泸州拼客网是泸州最专业的汽车垂直信息平台。"
  end


end
