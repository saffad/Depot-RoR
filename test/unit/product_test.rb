require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
   test "product attributes must not be empty" do
     product = Product.new
     assert product.invalid?
     assert product.errors[:title].any?
     assert product.errors[:author].any?
     assert product.errors[:description].any?
     assert product.errors[:price].any?
     assert product.errors[:picture].any?
     # assert product.errors[:image_url].any?
   end
   
   test "product price must be positive" do
     product = Product.new(title:       "My Book",
                           author: "zz",
                           description: "xyz",
                           picture:   "zzz.jpg")
     product.price = -1
     assert product.invalid?
     assert_equal "must be greater than or equal to 0.01", 
       product.errors[:price].join('; ')

     product.price = 0
     assert product.invalid?
     assert_equal "must be greater than or equal to 0.01", 
       product.errors[:price].join('; ')

     product.price = 1
     assert product.valid?
   end
   
   def new_product(image_url)
     Product.new(title:       "My Book ",
                 author: "Author",
                 description: "xyz",
                 price:       1,
                 image_url:   image_url)
   end

   # test "image url" do
   #   ok = %w{ test.gif test.jpg test.png TEST.JPG TEST.Jpg
   #            http://a.b.c/x/y/z/test.gif }
   #   bad = %w{ test.doc test.gif/more test.gif.more }

   #   ok.each do |name|
   #     assert new_product(name).valid?, "#{name} shouldn't be invalid"
   #   end

   #   bad.each do |name|
   #     assert new_product(name).invalid?, "#{name} shouldn't be valid"
   #   end
   # end
   
   test "product is not valid because title is not unique" do
     product = Product.new(title:       products(:softw).title,
                           author: "xyz", 
                           description: "yyy", 
                           price:       1, 
                           picture:   "fred.jpg")

     assert !product.save
     assert_equal "has already been taken", product.errors[:title].join('; ')
   end

   test "product is not valid without a unique title - i18n" do
     product = Product.new(title:       products(:softw).title,
                           author: "xyz",
                           description: "yyy", 
                           price:       1, 
                           picture:   "fred.jpg")

     assert !product.save
     assert_equal I18n.translate('activerecord.errors.messages.taken'),
                  product.errors[:title].join('; ')
   end
   
end
