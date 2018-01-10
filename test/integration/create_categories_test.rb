require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  
  #testing posting step
  ## 1. go to new category path
  ## 2. searching the new categories template
  ## 3. do post action
  ## 4. if post success go to index page
  ## 5. response result to index page
  # end testing
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end
  
  #testing posting step when failure
  ## 1. go to new category path
  ## 2. searching the new categories template
  ## 3. do post action
  ## 4. if post failure go to new page
  ## 5. response the error message to error message box, we select the error box html tag and/or class to show up
  # end testing
  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post_via_redirect categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'h4'
    assert_select 'ul.alert-messages__list'
  end
  
  
  
end