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
require 'elasticsearch/model'
class Carousel < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :name, presence: true
  validates :url, url: true
end
