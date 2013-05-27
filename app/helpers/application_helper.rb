# coding: utf-8
module ApplicationHelper



  def menu_nav(name, options = {}, &block)
    options[:class] = "#{name}"
    if name == :nav_home
      options[:title] = "首页"
      options[:href] = root_url
    elsif name == :nav_pinche
      options[:title] = "拼车"
      options[:href] = pinches_url
    elsif name == :nav_qiupin
      options[:title] = "求拼"
      options[:href] = qiupins_url
    elsif name == :nav_rent
      options[:title] = "租车"
      options[:href] = rents_url
    end
    if @menu_nav == name
      options[:class] += "_select"
    end

    content = capture(&block)
    content_tag(:a, content, options)
  end

  def status(what)
    options = {}
    if what == true
      @color = "green"
      @key = "已通过"
    else
      @color = "brown"
      @key = "审核中"
    end

    options[:style] = "color:#{@color}"
    content = content_tag(:a, @key, options)
  end
end
