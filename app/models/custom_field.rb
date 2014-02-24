class CustomField < ActiveRecord::Base
  belongs_to :fieldable, polymorphic: true, autosave: true

  validates :name, :field_type, :fieldable_id, :fieldable_type, presence: true

  def self.update_fields(custom_fields)
  	custom_fields.delete(:new).each { |field| CustomField.create(field) } if !custom_fields[:new].nil?
  	CustomField.update(custom_fields.keys, custom_fields.values)
  end
  
end
