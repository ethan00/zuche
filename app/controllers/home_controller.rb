class HomeController < ApplicationController
  menu_nav_highlight :nav_home
  def index
    @pinches = Pinche.checked.order('set_top').order('id desc').limit(10)
    @rents = Rent.checked.order('id desc').limit(10)
    @qiupins = Qiupin.checked.order('id desc').limit(10)
    @companies = Company.order('id desc').limit(10)
  end

  def contact_me

  end

  def service

  end

  def agreement

  end
end
