require 'rails_helper'

RSpec.describe College, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

   describe "test for name" do
      it "is invalid without name" do
          college = College.create(name:nil)
          expect(college).to_not be_valid
      end
     
      it "is should be unique" do
          college = College.create(name:"gvp")
          college1 = College.new(name:"gvp")
          expect(college1).to_not be_valid
      end

      it "should have a specified format" do
          college = College.create(name:"g.v.p")
          expect(college).to_not be_valid
      end
  end

  describe "test for location" do
      it "is invalid without location" do
          college = College.create(name:"gvp", location:nil)
          expect(college).to_not be_valid
      end
  end

  describe "test for email" do
      it "is must have an email" do
          college = College.create(name:"gvp", location:"visakhapatnam", email:"renuka@gmail.com", phno: "7848586589")
          expect(college).to be_valid
      end

      it "is valid with specified format" do
          college = College.create(name:"gvp", location:"visakhapatnam", email:"renuka@gmail.com", phno: "7848586589")
          expect(college).to be_valid
      end

      it "must be unique" do
          college = College.create(name:"gvp", location:"visakhapatnam", email:"renuka@gmail.com")
          college1 = College.create(name:"anits", location:"visakhapatnam", email:"renuka@gmail.com")
          expect(college1).to_not be_valid
      end

  end

  describe "test for phone number" do
      it "must have only numbers" do
          college = College.create(name:"gvp", location:"visakhapatnam", email:"renuka@gmail.com",phno:"jshudeudh")
          expect(college).to_not be_valid
      end

      it "must have minimum 10 numbers" do
          college = College.create(name:"gvp", location:"visakhapatnam", email:"renuka@gmail.com", phno: "78485")
          expect(college).to_not be_valid

      end

      it "must have maximum 10 numbers" do
          college = College.create(name:"gvp", location:"visakhapatnam", email:"renuka@gmail.com", phno: "784855896811")
          expect(college).to_not be_valid

      end
  end
end
