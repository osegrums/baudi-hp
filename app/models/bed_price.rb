class BedPrice < ActiveRecord::Base
  belongs_to :bed
  belongs_to :dimension
end

# == Schema Information
#
# Table name: bed_prices
#
#  id             :integer          not null, primary key
#  bed_id         :integer
#  has_decoration :boolean          default(FALSE)
#  has_rack       :boolean          default(FALSE)
#  dimension_id   :integer
#  kit_id         :integer
#  price          :decimal(10, 2)   default(0.0)
#  created_at     :datetime
#  updated_at     :datetime
#
