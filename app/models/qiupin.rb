# coding: utf-8
class Qiupin < ActiveRecord::Base
  attr_accessible :title, :body, :user, :tel, :des_province, :des_city, :des_county, :des_desc, :dep_province,
                  :dep_city, :dep_county, :dep_desc,:go_time,
                  :contact, :user_id, :is_checked
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  scope :unchecked, where(:is_checked => false)
  scope :checked, where(:is_checked => true)
  scope :all

  validates :title, :presence => true, :length => { :minimum => 4, :message => "标题必须大于4个字符"  }
  validates :go_time, :presence => true
  validates :dep_desc, :presence => true
  validates :des_desc, :presence => true

  validates :contact, :presence => true
  validates :tel, :presence => true, :format => { :with => /\d{11}/,
                                                  :message => "请留您真实的手机号码" },
            :length => { :is => 11, :message => "请输入手机号码"  }


end
