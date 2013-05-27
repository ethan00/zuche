# coding: utf-8
ActiveAdmin.register Qiupin do
  scope "未审核", :unchecked
  scope "全部", :all

  index do
    column "标题", :title
    column "出发时间", :go_time
    column "所在地", :dep_city
    column "目的地", :des_city
    column "联系人", :contact
    column "联系电话", :tel
    default_actions
  end
end
