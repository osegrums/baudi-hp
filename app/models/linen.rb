class Linen < ActiveRecord::Base
  has_many :dimensions, as: :itemable, dependent: :destroy
  has_many :kits, as: :itemable, dependent: :destroy
  has_many :linen_prices
  has_many :linen_purchases
  has_many :thumbs, as: :thumbable, dependent: :destroy
end

# == Schema Information
#
# Table name: linens
#
#  id             :integer          not null, primary key
#  code           :string(255)
#  name           :string(255)
#  sequence       :integer
#  description_lv :text
#  description_ru :text
#  description_en :text
#  created_at     :datetime
#  updated_at     :datetime
#
