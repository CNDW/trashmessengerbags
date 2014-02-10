class Product < ActiveRecord::Base
  has_many :gallery_indices, as: :gallery_indexable, dependent: :destroy, autosave: true
  has_many :images, through: :gallery_indices, autosave: true
  has_many :galleries, through: :gallery_indices
  has_many :custom_items, autosave: true, dependent: :nullify
  belongs_to :product_category, autosave: true
  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  def option_list#need to update for new option structure
  end

end