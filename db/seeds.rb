# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'forgery'
Admin.create!(name: 'admin', password: 'password', password_confirmation: 'password', email: 'admin@trashbags.com')
product_hash = { "Bags" => {'Messenger Bags' => [["Trash Can", "trashcan.jpg"], ["Dumpster", "dumpster.jpg"], ["Landfill", "landfill.jpg"]], 'Courier Flap Packs' => [["Garbage Fire", "fire.jpg"], ["Garbage Burner", "burner.jpg"], ["Garbage Incinerator", "incinerator.jpg"], ["Garbage Inferno", "inferno.jpg"]], 'Rolltop Courier Packs' => [["Garbage Disposal", "disposal.jpg"], ["Garbage Truck", "truck.jpg"], ["Garbage Barge", "barge.jpg"], ["Garbage Vortex", "vortex.jpg"]], 'Bike Travel Box' => [["Space Junk", "spacejunk.jpg"]], 'Hip Packs' => [["Wastebasket", "wastebasket.jpg"], ["Wastebasket II", "wastebasket2.jpg"], ["Waste Bin", "wastebin.jpg"], ["Tin Bin", "wastebin.jpg"]]}, "Apparel" => {'Hats' => [["Garbage Lid", "hat.jpg"]], 'Gloves' => [["Garbage Picker Mittens", "mitten.jpg"], ["Garbage Picker Lobster", "glove1.jpg"]], 'Facemasks' => [["Garbage Mask", "facemask.jpg"]], 'Wallets' => [["Cash Stash", "wallets.jpg"]]}, "Utility" => {'Drink Coozies' => [["Tall Boy Coozie", "tallboy.jpg"]], 'Belt Accessories' => [["Smart Phone Holster", "phone.jpg"], ["U-Lock Belt", "ulockbelt.jpg"]], 'Bike Accessories' => [["Top-Tube Pads", "tubetoppads.jpg"]], 'Bag Accessories' => [["Compactor", "compactor.jpg"]] } }

options_hash = { "Colors" => [["Black", "black.jpg"], ["Gunmetal", "gunmetal.jpg"], ["Charcoal", "charcoal.jpg"], ["Silver", "silver.jpg"], ["White", "white.jpg"], ["Olive Green", "olivegreen.jpg"], ["Kelly Green", "kellygreen.jpg"], ["Neon Green", "neongreen.jpg"], ["Neon Pink", "neonpink.jpg"], ["Red", "red.jpg"], ["Burgundy", "burgundy.jpg"], ["Tan", "tan.jpg"], ["Bronze", "bronze.jpg"], ["Brown", "brown.jpg"], ["Blaze Orange", "blazeorange.jpg"], ["Mandarin Orange", "mandarinorange.jpg"], ["Goldenrod", "goldenrod.jpg"], ["Yellow", "yellow.jpg"], ["Navy Blue", "navyblue.jpg"], ["Royal Blue", "royalblue.jpg"], ["skyblue", "skyblue.jpg"], ["purple", "purple.jpg"], ["teal", "teal.jpg"], ["rust", "rust.jpg"], ["woodlandcamo", "woodlandcamo.jpg"], ["Real Tree", "realtree.jpg"], ["Woodlands Marpat", "woodlandsmarpat.jpg"], ["Multicam", "multicam.jpg"]], "Extras" => [["X-Strap"], ["Stash Pocket"], ["Double Front Pocket"], ["Sewn-In Back Pad"], ["Change Pocket"], ["Phone Holster"], ["Matching Tool Pouch"], ["Base Compression Straps"], ["Side Pocket/Organizer"], ["Right Shoulder(left is standard)"], ["Pen Slots"], ["Cargo Straps"], ["Clear Vinyl Flap Signange Display Pocket"]], "Sizes" => [["Small"], ["Medium"], ["Large"]] }

image_paths = Array.new(16).map.with_index { |x, i| Rails.root.join("db", "imageseed", "bag#{i + 1}.jpg") }

product_hash.each do |category, types|
	types.each do |type, models|
		ProductType.create(name: type, desc: Forgery(:trash).sentence, category: category)
		models.each do |model|
			Product.create( name: model[0], desc: Forgery(:trash).sentence, price: Random.rand(300), product_type: ProductType.find_by(name: type), images_attributes: [title: model[0], image_data: File.open( Rails.root.join("db", "imageseed", "#{model[1]}") ) ] )
		end 
	end	
end

options_hash.each do |type, options|
	OptionType.create(name: type)
	options.each do |option|
		Option.create( name: option[0], price: Random.rand(300), option_type: OptionType.find_by(name: type) )
		Image.create( title: option[0], image_data: File.open( Rails.root.join("db", "imageseed", "colors", "#{option[1]}") ), options: [Option.find_by(name: option[0])] ) if option.length > 1
	end
end

Gallery.create( name: "home_carousel", title: "Home", slideshow: true, desc: Forgery(:trash).sentence )
16.times { |i| Image.create(name: Forgery(:trash).name, title: Forgery(:trash).name, desc: Forgery(:trash).sentence, image_data: File.open(image_paths[i]), galleries: [Gallery.find_by(name: "home_carousel")] ) }
