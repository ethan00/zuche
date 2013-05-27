class CenterController < ApplicationController
  before_filter :is_authorize

  def my_pinches_list
    @pinches = current_user.pinches

  end

  def my_qiupins_list
    @qiupins = current_user.qiupins

  end

  def my_rents_list
    @rents = current_user.rents
  end

  def change_password

  end
end