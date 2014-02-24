class CustomField < ActiveRecord::Base
  belongs_to :fieldable, polymorphic: true, autosave: true

  def self.update_fields(custom_fields)
  	new = custom_fields.delete(:new)
  	new.each { |field| CustomField.create(field.keep_if{ |k,v| k != "_destroy" }) } if !new.nil?
  	CustomField.update(custom_fields.keys, custom_fields.values.map{ |i| i.keep_if{ |k,v| k != "_destroy" } })
  end
  
end
