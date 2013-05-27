# coding: utf-8
ActiveAdmin.register Rent do
  scope "未审核", :unchecked
  scope "全部", :all

  index do
    column "标题", :title
    column "所在地", :departure
    column "租车性质", :style
    column "车辆信息", :car_info
    column "联系人", :contact
    column "联系电话", :tel
    column "价格", :price
    default_actions
  end
end
