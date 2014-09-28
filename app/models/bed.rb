class Bed < ActiveRecord::Base
  has_many :colors, as: :itemable
  has_many :dimensions, as: :itemable
  has_many :kits, as: :itemable
  has_many :bed_prices

  validates :code, uniqueness: true
  validates :name, :code, presence: true

  accepts_nested_attributes_for :bed_prices, reject_if: proc { |attributes| attributes['price'].to_f == 0 }, allow_destroy: true

  def price_for_editing(kit, dimension, has_decoration, has_rack)
    bed_prices.find_or_initialize_by(
        kit: kit,
        dimension: dimension,
        has_decoration: has_decoration,
        has_rack: has_rack
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
