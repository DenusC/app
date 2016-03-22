# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  url            :string
#  thumbnail_path :string
#  caption        :string
#  author_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Video < ActiveRecord::Base
end
