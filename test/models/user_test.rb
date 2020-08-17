require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(name: 'tanaka', email: 'tanaka@tanaka.com',
    password: 'foobar', password_confirmation: 'foobar')
  end
  
  test 'should be valid' do
    assert @user.valid?
  end
  
  test 'name should be present' do
    @user.name = ""
    assert_not @user.valid?
    
    @user.name = "   "
    assert_not @user.valid?
  end
  
  test 'email should be present' do
    @user.email = ""
    assert_not @user.valid?
    
    @user.email = "   "
    assert_not @user.valid?
  end
  
  test 'name should not be too long' do
    @user.name = 'a'*51
    assert_not @user.valid?
  end
  
  test 'email should not be too long' do
    @user.email = 't'*255 + '@tanaka.com'
    assert_not @user.valid?
  end
  
  test 'email should be format' do
    email_format = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org 
                      first.last@foo.jp alice+bob@baz.cn]
    email_format.each do | format |
      @user.email = format
      assert @user.valid?, "#{format.inspect} should be valid"
      # inspect メソッドでどのメールアドレスが失敗したか分かる。
    end
  end
  
  test "email should not be format" do
    not_email_format = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com foo@bar-.com]
    not_email_format.each do |format|
      @user.email = format
      assert_not @user.valid?, "#{format.inspect} should be invalid"
    end
  end
  
  test 'email should be unique' do
    diplicate_user = @user.dup
    @user.save
    assert_not diplicate_user.valid?
  end
  
  test 'password should hava a minimum length' do
    @user.password = @user.password_confirmation = 'a'*5;
    assert_not @user.valid?
  end
  
  test 'password should not be blank' do
    @user.password = @user.password_confirmation = "";
    assert_not @user.valid?
    
    @user.password = @user.password_confirmation = "  ";
    assert_not @user.valid?
  end
end
