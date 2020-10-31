# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  published    :boolean
#  published_at :datetime
#  author_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :author
  has_many :elements
end
