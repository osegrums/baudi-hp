class Linen < ActiveRecord::Base
  has_many :dimensions, as: :itemable, dependent: :destroy
  has_many :kits, as: :itemable, dependent: :destroy
  has_many :linen_prices
  has_many :linen_purchases
  has_many :thumbs, as: :thumbable, dependent: :destroy

  accepts_nested_attributes_for :linen_prices, reject_if: proc { |attributes| attributes['price'].to_f == 0 }, allow_destroy: true

  def main_thumb
    thumbs.where(is_kit_image: false).order(is_default: :asc, sequence: :asc).first
  end

  def price_for_editing(dimension, kit)
    linen_prices.find_or_initialize_by(
        dimension: dimension,
        kit: kit
      )
  end
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
