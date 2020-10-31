# == Schema Information
#
# Table name: elements
#
#  id           :integer          not null, primary key
#  element_type :string
#  content      :text
#  post_id      :integer          not null
#  position     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Element < ApplicationRecord
  belongs_to :post

  validates :element_type, inclusion: { in: ['paragraph', 'image', 'video-embed']}
end
