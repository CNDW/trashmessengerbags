# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'forgery'
Admin.create!(name: 'admin', password: 'password', password_confirmation: 'password', email: 'admin@trashbags.com')
category = { "Bags" => {'Messenger Bags' => ["Trash Can", "Dumpster", "Landfill"], 'Courier Flap Packs' => ["Garbage Fire", "Garbage Burner", "Garbage Incinerator", "Garbage Inferno"], 'Rolltop Courier Packs' => ["Garbage Disposal", "Garbage Truck", "Garbage Barge", "Garbage Vortex"], 'Bike Travel Box' => ["Space Junk"], 'Hip Packs' => ["Wastebasket", "Wastebasket II", "Waste Bin", "Tin Bin"]}, "Apparel" => {'Hats' => ["Garbage Lid"], 'Gloves' => ["Garbage Picker Mittens", "Garbage Picker Lobster"], 'Facemasks' => ["Garbage Mask"], 'Wallets' => ["Cash Stash"]}, "Utility" => {'Drink Coozies' => ["Tall Boy Coozie"], 'Belt Accessories' => ["Smart Phone Holster", "U-Lock Belt"], 'Bike Accessories' => ["Top-Tube Pads"], 'Bag Accessories' => ["Compactor"] } }

image_paths = Array.new(16).map.with_index { |x, i| Rails.root.join("db", "imageseed", "bag#{i + 1}.jpg") }

category.each do |key, category|
	category.each do |cat, model|
		ProductCategory.create(name: cat, desc: Forgery(:trash).sentence, category: key)
		model.each do |mod|
			if key == "Bags"
				Product.create(name: mod, desc: Forgery(:trash).sentence, price: Random.rand(300), product_category: ProductCategory.find_by(name: cat), images_attributes: [title: mod, image_data: File.open(image_paths.sample)])
			else
				Product.create(name: mod, desc: Forgery(:trash).sentence, price: Random.rand(300), product_category: ProductCategory.find_by(name: cat))
			end
		end 
	end	
end
