class Purchase < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true
  belongs_to :itemable_price, polymorphic: true
  belongs_to :kit_price
  belongs_to :color

  before_create :set_uid

  before_validation :update_price

  validate :uid, uniqueness: true

  def kit
    itemable.is_a?(Bed) ? kit_price.try(:kit) : itemable_price.try(:kit)
  end

  private

  def update_price
    self.price_itemable = itemable_price.price
    self.price_kit      = kit_price ? kit_price.price : 0
    self.price          = self.price_itemable + self.price_kit
  end

  def set_uid
    self.uid = SecureRandom.uuid
  end
end

# == Schema Information
#
# Table name: purchases
#
#  id                  :integer          not null, primary key
#  uid                 :string(255)
#  itemable_id         :integer
#  itemable_price_id   :integer
#  color_id            :integer
#  price               :decimal(10, 2)
#  name                :string(255)
#  email               :string(255)
#  phone               :string(255)
#  notes               :text
#  state               :string(255)      default("new")
#  ip_address          :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  address             :string(255)
#  zip_code            :string(255)
#  city                :string(255)
#  country             :string(255)
#  kit_price_id        :integer
#  price_kit           :decimal(10, 2)
#  price_itemable      :decimal(10, 2)
#  itemable_type       :string(255)
#  itemable_price_type :string(255)
#
