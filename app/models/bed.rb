class Bed < ActiveRecord::Base
  has_many :colors, as: :itemable
  has_many :dimensions, as: :itemable
  has_many :kits, as: :itemable

  validates :code, uniqueness: true
  validates :name, :code, presence: true
end

# == Schema Information
#
# Table name: beds
#
#  id             :integer          not null, primary key
#  code           :string(255)
#  name           :string(255)
#  sequence       :integer
#  has_decoration :boolean
#  has_rack       :boolean
#  description_lv :text
#  description_ru :text
#  description_en :text
#  created_at     :datetime
#  updated_at     :datetime
#
