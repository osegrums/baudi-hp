class Kit < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true
  has_many :thumbs, as: :thumbable

  def name
    name_lv || name_en || name_ru
  end
end

# == Schema Information
#
# Table name: kits
#
#  id            :integer          not null, primary key
#  itemable_id   :integer
#  itemable_type :string(255)
#  name_lv       :string(255)
#  name_en       :string(255)
#  name_ru       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  is_default    :boolean          default(FALSE)
#