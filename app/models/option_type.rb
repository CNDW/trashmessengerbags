class OptionType < ActiveRecord::Base
	has_many :options, dependent: :destroy
	has_many :fields, class_name: "OptionField"
	accepts_nested_attributes_for :fields, allow_destroy: true


	def type
		self.name.singularize
	end
end
