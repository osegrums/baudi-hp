class Linen < ActiveRecord::Base
  has_many :dimensions, as: :itemable, dependent: :destroy
  has_many :kits, as: :itemable, dependent: :destroy
  has_many :linen_prices
  has_many :purchases, as: :itemable
  has_many :thumbs, as: :thumbable, dependent: :destroy

  accepts_nested_attributes_for :linen_prices, reject_if: proc { |attributes| attributes['price'].to_f == 0 }, allow_destroy: true

  def main_thumb
    thumbs.where(is_kit_image: false).order(is_default: :asc, sequence: :asc).first
  end

  def price_for_editing(dimension, has_decoration, kit)
    linen_prices.find_or_initialize_by(
        dimension:      dimension,
        has_decoration: has_decoration,
        kit:            kit
      )
  end

  def decoration_prices
    query = <<-SQL.squish
      SELECT w.linen_id, w.dimension_id, w.price - wo.price AS price
        FROM linen_prices w
        JOIN linen_prices wo ON w.linen_id = wo.linen_id
                            AND w.dimension_id = wo.dimension_id
       WHERE w.linen_id = #{id}
         AND w.has_decoration = true
         AND wo.has_decoration = false
    SQL

    LinenPrice.find_by_sql(query)
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
#  has_decoration :boolean          default(FALSE)
#
