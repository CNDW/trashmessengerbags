module ApplicationHelper

	def link_to_add_fields(name, parent)
		new_object = CustomField.new(fieldable_type: parent.class.to_s, fieldable_id: parent.id)
		id = new_object.object_id
		fields = fields_for("custom_fields[new][]", new_object) do |builder|
			render(partial: "fields", locals: { f: builder })
		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def link_to_edit_custom_fields(name, object)
		id = object.id
		type = object.class.to_s
		link_to(name, edit_multiple_custom_fields_path(fieldable_id: id, fieldable_type: type), class: "edit_custom_fields btn btn-primary")
	end

	def edit_parent_path(parent_object)
		"/#{parent_object.class.to_s.underscore.pluralize}/#{parent_object.id}/edit"
	end

	def required_field_check(field)
		"*" if field.required
	end

	def field_settings_for(field)
		store_sections = %w[catalogue custom_shop in_stock].map{|x| "#{x.to_s.humanize}" if field.send(x)}.select{|x|!x.nil?}.join(" / ")
		"The Field will display in the following store sections: #{store_sections}" unless store_sections.empty?
	end
end