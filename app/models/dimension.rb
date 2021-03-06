class Dimension < ActiveRecord::Base
  belongs_to :itemable, polymorphic: true
end

# == Schema Information
#
# Table name: dimensions
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  itemable_id   :integer
#  itemable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  is_default    :boolean          default(FALSE)
#  short_name    :string(255)
#  sequence      :integer          default(0)
#
