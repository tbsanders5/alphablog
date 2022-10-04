require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup 
    @category = Category.create(name: "LFG")
    @category2 = Category.create(name: "Achievments") 
  end

  test "should show categories lsiting" do 
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end
