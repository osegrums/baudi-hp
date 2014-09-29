class BedPurchase < ActiveRecord::Base
  belongs_to :bed
  belongs_to :bed_price

  before_create :set_uid

  private

  def set_uid
    self.uid = SecureRandom.uuid
  end
end

# == Schema Information
#
# Table name: bed_purchases
#
#  id           :integer          not null, primary key
#  uid          :string(255)
#  bed_id       :integer
#  bed_price_id :integer
#  color_id     :integer
#  price        :decimal(10, 2)
#  name         :string(255)
#  email        :string(255)
#  phone        :string(255)
#  notes        :text
#  state        :string(255)
#  ip_address   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
