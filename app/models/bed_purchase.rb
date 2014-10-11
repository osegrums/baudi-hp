class BedPurchase < ActiveRecord::Base
  belongs_to :bed
  belongs_to :bed_price
  belongs_to :color

  before_create :set_uid

  before_validation :update_price

  private

  def update_price
    if bed_price_id_changed?
      self.price = bed_price.price
    end
  end

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
#  state        :string(255)      default("new")
#  ip_address   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  address      :string(255)
#  zip_code     :string(255)
#  city         :string(255)
#  country      :string(255)
#
