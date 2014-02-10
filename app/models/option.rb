class Option < ActiveRecord::Base
	belongs_to :customizable, polymorphic: true, autosave: true
	belongs_to :optionable, polymorphic: true, autosave: true

end
