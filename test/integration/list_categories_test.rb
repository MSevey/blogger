require 'test_helper'
require 'rails-controller-testing'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "books")
		@category2 = Category.create(name: "promgramming")
	end

	test "should show categories listing" do
		get categories_path
		assert_template 'categories/index'
		assert_select "a[herf=?]", category_path(@category), text: @category.name
		assert_select "a[herf=?]", category_path(@category2), text: @category2.name
	end

end
