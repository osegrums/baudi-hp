class Thumb < ActiveRecord::Base
  belongs_to :thumbable, polymorphic: true

  mount_uploader :file, ThumbUploader
end

# == Schema Information
#
# Table name: thumbs
#
#  id             :integer          not null, primary key
#  thumbable_id   :integer
#  thumbable_type :string(255)
#  file           :string(255)
#  sequence       :integer
#  description    :text
#  name           :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
