class Option < ActiveRecord::Base
	belongs_to :option_type, dependent: :destroy

  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices, dependent: :destroy
	has_many :customizers, as: :customizable, dependent: :destroy
  has_many :products, through: :customizers, dependent: :destroy
  has_many :custom_fields, as: :fieldable, dependent: :destroy
  
  store_accessor :properties

  delegate :type, to: :option_type, prefix: false

end
