# coding: utf-8
class Rent < ActiveRecord::Base
  attr_accessible :body, :title, :style, :tel, :contact, :user, :price,
                  :car_info, :departure, :user_id, :is_checked
  has_many :comments, :as => :commentable, :dependent => :destroy
  belongs_to :user
  scope :unchecked, where(:is_checked => false)
  scope :checked, where(:is_checked => true)
  scope :all

  validates :title, :presence => true, :length => { :minimum => 4, :message => "标题必须大于4个字符"  }
  validates :departure, :presence => true
  validates :style, :presence => true
  validates :price, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :message => "必须是数字"  }
  validates :car_info, :presence => true

  validates :contact, :presence => true
  validates :tel, :presence => true, :format => { :with => /\d{11}/,
                                                  :message => "请留您真实的手机号码" },
            :length => { :is => 11, :message => "请输入手机号码"  }

end
