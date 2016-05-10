require 'rails_helper'

RSpec.describe CollegesController, type: :controller do

	let(:valid_attributes){
		{name: "sivani",location: "srikakulam",email: "sivani.s@org.co",phno:"1234567890"}
		
	}

	let(:invalid_attributes){
		{name:nil,email:nil,location:nil,phno:nil}
	}

	describe "GET new" do
	  it "assigns a new college as @college" do
	    get :new, {}
	    expect(assigns(:college)).to be_a_new(College)
	  end
	end

	describe "GET index" do
	  it "assigns all colleges as @colleges" do
	  	college = College.create!(valid_attributes)
	  	college.save
	  	get :index,{ }
	  	expect(assigns(:colleges)).to eq([college])
	  end
	end

	describe "GET show" do
	  it "assigns show student as @college" do 
	  	college = College.create(valid_attributes)
	  	get :show,{:id => college.to_param}
	  	expect(assigns(:college)).to eq(college)
	  end
	end

	describe "POST create" do
	  describe "with valid attributes" do
		  it "creates a new student" do
					
				expect{
					post :create,{:college => valid_attributes}
				}.to change(College, :count).by(1)
		  end

			it "assigns a newly created student to @student" do
			  post :create,{:college => valid_attributes}
			  expect(assigns(:college)).to be_a(College)
			end

			it "redirect_to index path" do
			  post :create,{:college => valid_attributes}
			  expect(response).to redirect_to(colleges_path)
			end
		end

		describe "with invalid attributes" do
			it "assigns a newly created but unsaved user as @student" do
        post :create, {:college => invalid_attributes}
        expect(assigns(:college)).to be_a_new(College)
      end

			it "render to new path" do
			  post :create,{:college => invalid_attributes}
			  expect(response).to render_template("new")
			end
		end
	end

	

end
