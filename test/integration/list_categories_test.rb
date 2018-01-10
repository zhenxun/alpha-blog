require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "programming")
  end
  
  #testing listing categories
  ## 1. go to categories_path
  ## 2. searching the categories listing template location
  ## 3. link to category show page, we use method 'assert_select' the html link tag and we want to sure the link to the category show path, and remember to send the category id, and 
  ##    the text to display '@category.name', should the link show category text
  ## 4. set another category show page, we setup before 
  #end testing
  test "should show categories listing" do
     get categories_path
     assert_template 'categories/index'
     assert_select "a[href=?]", category_path(@category), text: @category.name
     assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
  
end