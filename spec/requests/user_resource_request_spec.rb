require 'spec_helper'

describe "user resource" do
  describe "POST /users" do
    context "with valid attributes" do
      before(:each) do
        data = {
          :user => {
            :email => "a@a.com",
            :password => "pass",
            :password_confirmation => "pass",
            :first_name => "f",
            :last_name => "l",
          }
        }

        post "/users", data
        @response = response
      end

      it "returns correct status code" do
        @response.status.should == 201
      end

      it "returns correct json" do
        attributes = JSON.parse(@response.body)
        attributes["name"].should == "f l"
        attributes["email"].should == "a@a.com"
      end
    end

    context "with invalid attributes" do
      before(:each) do
        data = {
          :user => {
            :email => "a@a.com",
            :password => "pass",
            :password_confirmation => "pas",
            :first_name => "",
            :last_name => "l",
          }
        }

        post "/users", data
        @response = response
      end

      it "returns 422 status code" do
        @response.status.should == 422        
      end

      it "returns error json" do
        attributes = JSON.parse(@response.body)
        attributes["password"] == ["doesn't match confirmation"]
        attributes["first_name"] == ["can't be blank"]
      end
    end
  end
end