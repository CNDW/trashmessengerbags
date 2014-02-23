class OptionType < ActiveRecord::Base
	has_many :options, dependent: :destroy
  has_many :custom_fields, as: :fieldable, dependent: :destroy

	def type
		self.name.singularize
	end
end
