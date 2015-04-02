class Product < ActiveRecord::Base
	has_attached_file :main_image, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :main_image, :content_type => /\Aimage\/.*\Z/

	has_attached_file :image1, :styles =>
	{ :medium => "300x300>>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

	has_attached_file :image2, :styles =>
	{ :medium => "300x300>>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/

		has_attached_file :image3, :styles =>
	{ :medium => "300x300>>", :thumb => "100x100>" },
	:default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/
	
	has_many :reviews
	has_many :line_items
	is_impressionable  counter_cache: true
	

	
	
end
