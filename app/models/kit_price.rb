class KitPrice < ActiveRecord::Base
  belongs_to :kit
  belongs_to :dimension

  validates :kit, uniqueness: { scope: :dimension, message: "should have only one price per kit and dimension" }
end

# == Schema Information
#
# Table name: kit_prices
#
#  id           :integer          not null, primary key
#  bed_id       :integer
#  kit_id       :integer
#  dimension_id :integer
#  price        :decimal(10, 2)   default(0.0)
#  created_at   :datetime
#  updated_at   :datetime
#
