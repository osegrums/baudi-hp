class Kit < ActiveRecord::Base
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
#
