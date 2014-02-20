class Option < ActiveRecord::Base
	belongs_to :option_type, dependent: :destroy
	has_many :customizers, dependent: :destroy
end
