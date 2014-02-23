class Option < ActiveRecord::Base
	belongs_to :option_type, dependent: :destroy

  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy
  has_many :images, through: :gallery_indices, dependent: :destroy
	has_many :customizers, dependent: :destroy
  has_many :products, through: :customizers, dependent: :destroy
  has_many :custom_fields, as: :fieldable, dependent: :destroy
  
  store_accessor :properties
  
  validate :validate_properties

  delegate :type, to: :option_type, prefix: false

  def validate_properties
    option_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
end
