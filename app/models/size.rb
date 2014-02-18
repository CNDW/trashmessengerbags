class Size < ActiveRecord::Base
	has_many :options, as: :customizable, dependent: :destroy, autosave: true
	has_many :products, through: :options, autosave: true
	has_many :custom_items, through: :options, autosave: true

end