class Forgery::Trash < Forgery
 def self.adjective
 	dictionaries[:adjectives].random.unextend
 end

 def self.verb
 	dictionaries[:verbs].random.unextend
 end

 def self.noun
 	dictionaries[:nouns].random.unextend
 end

 def self.adverb
 	dictionaries[:adverbs].random.unextend
 end

 def self.category
 	"#{noun}"
 end

 def self.product
 	"#{adjective} #{noun}"
 end

 def self.sentence
 	"#{adjective} #{noun} #{adverb} #{verb}."
 end

end