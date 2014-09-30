class Bed < ActiveRecord::Base
  include Bootsy::Container
  has_many :colors, as: :itemable
  has_many :dimensions, as: :itemable
  has_many :kits, as: :itemable
  has_many :bed_prices
  has_many :bed_purchases
  has_many :thumbs, as: :thumbable

  validates :code, uniqueness: true
  validates :name, :code, presence: true

  after_create :create_default_kit

  accepts_nested_attributes_for :bed_prices, reject_if: proc { |attributes| attributes['price'].to_f == 0 }, allow_destroy: true

  def main_thumb
    thumbs.order(is_default: :asc).first
  end

  def price_for_editing(kit, dimension, has_decoration, has_rack)
    bed_prices.find_or_initialize_by(
        kit: kit,
        dimension: dimension,
        has_decoration: has_decoration,
        has_rack: has_rack
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
