require 'rails_helper'

RSpec.describe Student, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  	
  	describe "test for name" do
	  	it "is invalid without name" do
			expect(Student.new(name:nil)).to_not be_valid
		end

		it "is invalid with other than letters" do
			college = College.create(name: "sivani",location: "srikakulam",email: "sivani@org",phno:"1234567890")
			student = Student.new(name:"vandana4545",email:"vandana.kalipatnapu@gmail.com",age:"18",dob:"09-07-1993",college_id:college.id)
			expect(student.name).to_not match(/\A[a-zA-Z]+\z/)
		end

		it "is invalid without uniqueness" do
			college = College.create(name: "sivani",location: "srikakulam",email: "sivani@org",phno:"1234567890")
			student = Student.create(name:"vandana")
			expect(Student.new(name:"renuka",email:"vandana.kalipatnapu@gmail.com",age:"18",dob:"09-07-1993",college_id: college.id)).to_not be_valid
		end
	end

	
	describe "test for email" do
		it "is invalid without email" do
			expect(Student.new(name:"vandana",email:nil,age:"18",dob:"09-07-1993")).to_not be_valid
		end

		it "is invalid without uniqueness" do
			college = College.create(name: "sivani",location: "srikakulam",email: "sivani@org",phno:"1234567890")
			Student.create(email:"vandana.kalipatnapu@gmail.com")
			expect(Student.new(name:"vandana",email:"van.kalipatnapu@gmail.com",age:"18",dob:"09-07-1993",college_id: college.id)).to_not be_valid
		end

		it "is invalid without the format" do
			student = Student.new(name:"vandana",email:"vandana.k@gmail.com",age:"18",dob:"09-07-1993")
			expect(student.email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/)
		end 
	end

	
	describe "test for date of birth" do
		it "is invalid without dob" do
			expect(Student.new(name:"vandana",email:"v.k@gmail.com",dob:nil)).to_not be_valid
		end

		it "is invalid without the given format" do
			college = College.create(name: "sivani",location: "srikakulam",email: "sivani@org",phno:"1234567890")
			student = Student.new(name:"vandana",email:"vandana.k@gmail.com",age:"18",dob:"09-07-1993",college_id: college.id)
			expect(student.dob).to match(/\d{2}\-\d{2}\-\d{4}/)
		end

		# it "is invalid without neumericality" do
		# 	student = Student.new(name:"vandana",email:"vandana.k@gmail.com",age:"18",dob:"09-07-1993")
		# 	expect(student.dob).to match(/\A[0-9|\-]\z/)
		# end
	end

	
	describe "test for age" do
		it "is invalid without age" do
			expect(Student.new(name:"vandana",email:"v.k@gmail.com",age:nil,dob:"09-07-1993")).to_not be_valid
		end

		it "is invalid lessthan age 20" do 
			college = College.create(name: "sivani",location: "srikakulam",email: "sivani@org",phno:"1234567890")
			student = Student.new(name:"vandana",email:"vandana.k@gmail.com",age:"18",dob:"09-07-1993",college_id:college.id)
			expect(student.age).to be<="20"
			expect(student.age).to be>="10"
		end

		it "is invalid without the given format" do
			college = College.create(name: "sivani",location: "srikakulam",email: "sivani@org",phno:"1234567890")
			student = Student.new(name:"vandana",email:"vandana.k@gmail.com",age:"hfghf",dob:"09-07-1993",college_id:college.id)
			expect(student.age).to_not match(/\A[0-9]\z/)
		end
	end

  
		


  
end
