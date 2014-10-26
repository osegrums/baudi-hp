class Bed < ActiveRecord::Base
  has_many :colors, as: :itemable, dependent: :destroy
  has_many :dimensions, as: :itemable, dependent: :destroy
  has_many :kits, as: :itemable, dependent: :destroy
  has_many :bed_prices, dependent: :destroy
  has_many :kit_prices, dependent: :destroy
  has_many :bed_purchases, dependent: :nullify
  has_many :thumbs, as: :thumbable, dependent: :destroy

  validates :code, uniqueness: true
  validates :name, :code, presence: true

  after_create :create_default_kit

  accepts_nested_attributes_for :bed_prices, reject_if: proc { |attributes| attributes['price'].to_f == 0 }, allow_destroy: true
  accepts_nested_attributes_for :kit_prices, allow_destroy: true

  def main_thumb
    thumbs.order(is_default: :asc).first
  end

  def price_for_editing(dimension, has_decoration, has_rack)
    bed_prices.find_or_initialize_by(
        dimension: dimension,
        has_decoration: has_decoration,
        has_rack: has_rack
      )
  end

  def kit_price_for_editing(kit, dimension)
    kit_prices.find_or_initialize_by(
        dimension: dimension,
        kit: kit
      )
  end

  private

  def create_default_kit
    kits.create(
      name_lv: 'Nav komplekta',
      name_en: 'No linen',
      name_ru: 'Netu komplekta',
      is_default: true
    )
  end

end

# == Schema Information
#
# Table name: beds
#
#  id             :integer          not null, primary key
#  code           :string(255)
#  name           :string(255)
#  sequence       :integer
#  has_decoration :boolean
#  has_rack       :boolean
#  description_lv :text
#  description_ru :text
#  description_en :text
#  created_at     :datetime
#  updated_at     :datetime
#
