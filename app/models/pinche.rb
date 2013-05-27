# coding: utf-8
class Pinche < ActiveRecord::Base
  attr_accessible :title,:body, :user, :car_level, :car_info, :way, :car_info, :contact, :tel,
                  :person, :user_id, :go_time, :is_checked, :dep_province, :dep_city, :dep_county, :dep_desc,
                  :des_province, :des_city, :des_county, :des_desc
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates :title, :presence => true, :length => { :minimum => 4, :message => "标题必须大于4个字符"  }
  validates :go_time, :presence => true
  validates :way, :presence => true
  validates :car_info, :presence => true
  validates :car_level, :presence => true
  validates :dep_desc, :presence => true
  validates :des_desc, :presence => true
  validates :person, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :message => "至少要1个人"  }
  validates :contact, :presence => true
  validates :tel, :presence => true, :format => { :with => /\d{11}/,
                                                :message => "请留您真实的手机号码" },
            :length => { :is => 11, :message => "请输入手机号码"  }

  scope :unchecked, where(:is_checked => false)
  scope :checked, where(:is_checked => true)
  scope :all

end
