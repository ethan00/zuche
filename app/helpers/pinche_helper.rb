# coding: utf-8
module PincheHelper
  def condition(param)
    condition1 = "不限"
    condition1 = param[:des_province] if !param[:des_province].blank?
    condition1 += ", #{param[:des_city]}" if !param[:des_city].blank?
    condition1 += ", #{param[:des_county]}" if !param[:des_county].blank?

    condition = condition1
  end
end
