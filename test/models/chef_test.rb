require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
  	@chef = Chef.new(chefname: "john", email: "john@example.com")
  end

  test "chefname should be valid" do
  	assert @chef.valid?
  end

  test "chefname should be present" do
  	@chef.chefname = " "
  	assert_not @chef.valid?
  end

  test "chefname should not be too short" do
  	@chef.chefname = "a"
  	assert_not @chef.valid?
  end

  test "chefname should not be too long" do
  	@chef.chefname = "a" * 41
  	assert_not @chef.valid?
  end

  test "email should be present" do
  	@chef.email = " "
  	assert_not @chef.valid?
  end

  test "email length should be within bound" do
  	@chef.email = "a" * 101 + "@example.com"
  	assert_not @chef.valid?
  end

  test "email address should be unique" do
  	dup_chef = @chef.dup
  	dup_chef.email = @chef.email.upcase
  	@chef.save

  	assert_not dup_chef.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w(use@eee.com R_TDD-S@eee.hallo.org user@example.com first.last@eee.au laura+joe@joe.monk.cm)
  	valid_addresses.each do |email|
  		@chef.email = email
  		assert @chef.valid?, "#{email.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w(user@example,com user_at_eee.org user.name@example eee@i_am_.com foo@eee+aar.com)
  	invalid_addresses.each do |email|
  		@chef.email = email
  		assert_not @chef.valid?, "#{email.inspect} should be invalid"
  	end
  end
  
end
