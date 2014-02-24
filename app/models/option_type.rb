class OptionType < ActiveRecord::Base
	has_many :options, dependent: :destroy
  has_many :custom_fields, as: :fieldable, dependent: :destroy

  store_accessor :properties
  
	def type
		self.name.singularize
	end
end
