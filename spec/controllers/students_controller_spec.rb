require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

	let(:valid_attributes){
		  college = College.create(name:"GVP",location:"visakhapatnam",email:"gvpcew@gmail.com", phno:"7845789865")
    {name:"vandana", age:"22", dob:"09-10-1994", email:"v@gmail.com", college_id:college.id}
}


	let(:invalid_attributes){
		{name:nil,email:nil,dob:nil,age:nil}
	}

	describe "GET new" do
	  it "assigns a new student as @student" do
	    get :new, {}
	    expect(assigns(:student)).to be_a_new(Student)
	  end
	end

	
	describe "GET index" do
	  it "assigns all students as @students" do
	  	student = Student.create!(valid_attributes)
	  	get :index
	  	expect(assigns(:students)).to eq([student])
	  end
	end

	  	
	describe "GET show" do
	  it "assigns show student as @student" do 
	  	student = Student.create(valid_attributes)
	  	get :show,{:id => student.to_param}
	  	expect(assigns(:student)).to eq(student)
	  end
	end

	
	describe "POST create" do
	  describe "with valid attributes" do
		  it "creates a new student" do
					
				expect{
					post :create,{:student => valid_attributes}
				}.to change(Student, :count).by(1)
		  end

			it "assigns a newly created student to @student" do
			  post :create,{:student => valid_attributes}
			  expect(assigns(:student)).to be_a(Student)
			end

			it "redirect_to index path" do
			  post :create,{:student => valid_attributes}
			  expect(response).to redirect_to(students_path)
			end
		end

		describe "with invalid attributes" do
			it "assigns a newly created but unsaved user as @student" do
        post :create, {:student => invalid_attributes}
        expect(assigns(:student)).to be_a_new(Student)
      end

			it "render to new path" do
			  post :create,{:student => invalid_attributes}
			  expect(response).to render_template("new")
			end
		end
	end

	
		describe "GET edit" do 
		it "assigns the required student to @student" do
		  student = Student.create!(valid_attributes)
		  get :edit,{:id => student}
		  expect(assigns(:student)).to eq(student)
		end
	end

	
	describe "PUT update" do
		describe "valid attributes" do
			let(:new_valid_attributes){
				{name:"renuka",email:"salapurenuka@gmail.com",dob:"07-10-1994",age:"18"}
			}
			
			it "assigns the required user to @student" do
				student = Student.create!(valid_attributes) 
				put :update,{:id => student ,:student => new_valid_attributes}
				expect(assigns(:student)).to eq(student)
			end

			it "redirect to index" do
			  student = Student.create!(valid_attributes) 
			  put :update,{:id => student ,:student => new_valid_attributes}
			  expect(response).to redirect_to(students_path)
			end
		end
		describe "with invalid params" do
			it  "assigns the selected student as @student"do
				student = Student.create!(valid_attributes) 
				put :update,{:id => student ,:student => invalid_attributes}
				expect(assigns(:student)).to eq(student)
			end

			it "render to edit" do
			  student = Student.create!(valid_attributes) 
			  put :update,{:id => student ,:student => invalid_attributes}
			 	expect(response).to render_template("edit")
			end
		end
	end


	describe "DELETE destroy" do
  	it "destroy the required student" do
  		student = Student.create!(valid_attributes)
  			expect {
        delete :destroy, {:id => student}
      }.to change(Student, :count).by(-1)
  	end

  	it "redirect to index" do
  		student = Student.create!(valid_attributes)
  		delete :destroy,{:id => student}
  		expect(response).to redirect_to(students_path)
  	end
  end




end
