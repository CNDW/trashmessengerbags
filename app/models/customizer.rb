class Customizer < ActiveRecord::Base
	belongs_to :option
	belongs_to :customizable, polymorphic: true

end