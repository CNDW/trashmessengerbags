module ApplicationHelper
	def link_to_add_fields(name, parent)
		new_object = CustomField.new(fieldable_type: parent.class.to_s, fieldable_id: parent.id)
		id = new_object.object_id
		fields = fields_for("custom_fields[new][]", new_object) do |builder|
			render("fields", f: builder)
		end
		link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
	end

	def link_to_edit_custom_fields(name, object)
		id = object.id
		type = object.class.to_s
		link_to(name, edit_multiple_custom_fields_path(fieldable_id: id, fieldable_type: type), class: "edit_custom_fields btn btn-primary")
	end
end