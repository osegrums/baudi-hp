class Kit < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true

  def name
    name_lv || name_en || name_ru
  end

  def thumb
    thumbs.order(is_default: :asc).first
  end
end

# == Schema Information
#
# Table name: kits
#
#  id             :integer          not null, primary key
#  itemable_id    :integer
#  itemable_type  :string(255)
#  name_lv        :string(255)
#  name_en        :string(255)
#  name_ru        :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  is_default     :boolean          default(FALSE)
#  description_lv :text
#  description_en :text
#  description_ru :text
#  sequence       :integer          default(0)
#
