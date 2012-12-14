require 'spec_helper'

describe User do
  describe "validations" do
    [:email, :first_name, :last_name].each do |attribute|
      it "requires a #{attribute}" do
        User.new(attribute => "").error_on(attribute).should == ["can't be blank"]
      end
    end
  end

  describe "#authenticate" do
    before(:each) do
      @user = User.create! :email => "foo@bar.com", :password => "s", :password_confirmation => "s", :first_name => "f", :last_name => "l" 
    end

    context "with correct credential" do
      it "should return true" do
        pending
      end
    end

    context "with incorrect credential" do
      pending
    end
  end
end
