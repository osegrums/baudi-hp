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
    thumbs.where(is_kit_image: false).order(is_default: :asc, sequence: :asc).first
  end

  def kit_image
    thumbs.where(is_kit_image: true).first
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

  def decoration_prices
    query = <<-SQL.squish
      SELECT w.bed_id, w.dimension_id, w.has_rack, w.price - wo.price AS price
        FROM bed_prices w
        JOIN bed_prices wo ON w.bed_id = wo.bed_id
                          AND w.has_rack = wo.has_rack
                          AND w.dimension_id = wo.dimension_id
       WHERE w.bed_id = #{id}
         AND w.has_decoration = true
         AND wo.has_decoration = false
    SQL

    bed_prices = BedPrice.find_by_sql(query)
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
