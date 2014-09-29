class Color < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true
  has_many   :thumbs, as: :thumbable
end

# == Schema Information
#
# Table name: colors
#
#  id            :integer          not null, primary key
#  itemable_id   :integer
#  itemable_type :string(255)
#  name_lv       :string(255)
#  name_en       :string(255)
#  name_ru       :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
