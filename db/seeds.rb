# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'forgery'
Admin.create!(name: 'admin', password: 'password', password_confirmation: 'password', email: 'admin@trashbags.com')
category = { "Bags" => {'Messenger Bags' => [["Trash Can", "trashcan.jpg"], ["Dumpster", "dumpster.jpg"], ["Landfill", "landfill.jpg"]], 'Courier Flap Packs' => [["Garbage Fire", "fire.jpg"], ["Garbage Burner", "burner.jpg"], ["Garbage Incinerator", "incinerator.jpg"], ["Garbage Inferno", "inferno.jpg"]], 'Rolltop Courier Packs' => [["Garbage Disposal", "disposal.jpg"], ["Garbage Truck", "truck.jpg"], ["Garbage Barge", "barge.jpg"], ["Garbage Vortex", "vortex.jpg"]], 'Bike Travel Box' => [["Space Junk", "spacejunk.jpg"]], 'Hip Packs' => [["Wastebasket", "wastebasket.jpg"], ["Wastebasket II", "wastebasket2.jpg"], ["Waste Bin", "wastebin.jpg"], ["Tin Bin", "wastebin.jpg"]]}, "Apparel" => {'Hats' => [["Garbage Lid", "hat.jpg"]], 'Gloves' => [["Garbage Picker Mittens", "mitten.jpg"], ["Garbage Picker Lobster", "glove1.jpg"]], 'Facemasks' => [["Garbage Mask", "facemask.jpg"]], 'Wallets' => [["Cash Stash", "wallets.jpg"]]}, "Utility" => {'Drink Coozies' => [["Tall Boy Coozie", "tallboy.jpg"]], 'Belt Accessories' => [["Smart Phone Holster", "phone.jpg"], ["U-Lock Belt", "ulockbelt.jpg"]], 'Bike Accessories' => [["Top-Tube Pads", "tubetoppads.jpg"]], 'Bag Accessories' => [["Compactor", "compactor.jpg"]] } }

image_paths = Array.new(16).map.with_index { |x, i| Rails.root.join("db", "imageseed", "bag#{i + 1}.jpg") }

category.each do |key, category|
	category.each do |cat, model|
		ProductCategory.create(name: cat, desc: Forgery(:trash).sentence, category: key)
		model.each do |mod|
			Product.create( name: mod[0], desc: Forgery(:trash).sentence, price: Random.rand(300), product_category: ProductCategory.find_by(name: cat), images_attributes: [title: mod[0], image_data: File.open( Rails.root.join("db", "imageseed", "#{mod[1]}") ) ] )
		end 
	end	
end

Gallery.create( name: "home_carousel", title: "Home", slideshow: true, desc: Forgery(:trash).sentence )
16.times { |i| Image.create(name: Forgery(:trash).name, title: Forgery(:trash).name, desc: Forgery(:trash).sentence, image_data: File.open(image_paths[i]), galleries: [Gallery.find_by(name: "home_carousel")] ) }
