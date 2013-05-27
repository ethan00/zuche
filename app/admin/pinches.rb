# coding: utf-8
ActiveAdmin.register Pinche do

  scope "未审核", :unchecked
  scope "全部", :all

  index do
    column "标题", :title
    column "出发时间", :go_time
    column "档次", :car_level
    column "车型", :car_info
    column "联系人", :contact
    column "联系电话", :tel
    column "出发地", :dep_city
    column "目的地", :des_city
    column "发布时间", :created_at
    column "更新时间", :updated_at
    default_actions
  end
  
end
