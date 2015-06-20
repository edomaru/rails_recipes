require "test_helper"

class RecipeTest < ActiveSupport::TestCase
	def setup
		@recipe = Recipe.new(name: "chicken parms", summary: "this is the best chicken parm recipe ever",
					description: "heat oil, add onions, etc.")
	end

	test "reipe should be valid" do
		assert @recipe.valid?
	end

	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end

	test "name length should not be too long" do
		@recipe.name = "a" * 101
		assert_not @recipe.valid?
	end

	test "name length should not be too short" do
		@recipe.name = "aaaa"
		assert_not @recipe.valid?
	end

	test "summary should be present" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end

	test "summary length should not be too long" do
		@recipe.summary = "e" * 151
		assert_not @recipe.valid?
	end

	test "summary length should not be too short" do
		@recipe.summary = "eeeee"
		assert_not @recipe.valid?
	end

	test "description must be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end

	test "description should not be too long" do
		@recipe.description = "e" * 501
		assert_not @recipe.valid?
	end

	test "description should not be too short" do
		@recipe.description = "e333df"
		assert_not @recipe.valid?
	end
end