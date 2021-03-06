class LinenPrice < ActiveRecord::Base
  belongs_to :kit
  belongs_to :dimension
  belongs_to :linen

  validates :linen, uniqueness: { scope: [:dimension, :kit, :has_decoration],
    message: "should have only one price per kit, dimension and has_decoration" }
end

# == Schema Information
#
# Table name: linen_prices
#
#  id             :integer          not null, primary key
#  linen_id       :integer
#  dimension_id   :integer
#  kit_id         :integer
#  price          :decimal(10, 2)   default(0.0)
#  created_at     :datetime
#  updated_at     :datetime
#  has_decoration :boolean          default(FALSE)
#
