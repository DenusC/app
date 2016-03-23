# == Schema Information
#
# Table name: carousels
#
#  id         :integer          not null, primary key
#  name       :string
#  photo_path :string
#  priority   :integer
#  caption    :text
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Carousel < ActiveRecord::Base
  validates :name, presence: true
end
