class CollegesController < ApplicationController
	def new
		@college = College.new
	end

	def index
		@colleges = College.all
		render json: {success: true, message: "All colleges selected",college: @colleges}
	end

	def show
		@college = College.find(params[:id])
		render json: {success: true, message: "a college is selected",college: @college}
	end

	def create
		@college = College.new(college_params)
      	if @college.save
       		 render json: {success: true, message: "college has been created",college: @college} 
       		# redirect_to colleges_path
      	else
      		 render json: {success: false, message: "college hasnot been created",errors: @college.errors.full_messages} 
      		# render 'new'
      	end
	end

	def edit
		@college = College.find(params[:id])
		render json: {success: true,message: "Selected college is edited successfully",college: @college}
	end

	def update
		@college = College.find(params[:id])
		if @college.update(college_params)
		    render json: {success: true,message: "selected college has been updated",college: @college} 
			# redirect_to colleges_path
		else
			render json: {success: false, message: "selected college hasnot been selected",errors: @college.errors.full_messages} 
			# render "edit"
		end
	end

	def destroy
		@college = College.find(params[:id])
		if @college.destroy
			render json: {success: true, message: "Selected college has been deleted",college: @college}
		else
			render json: {success: false, message: "Selected college has been deleted",errors: @college.errors.full_messages}
		end
	end

	private 
		def college_params
			#if we pass params then test cases will work
			params.permit(:name,:email,:phno,:location)
		end

end
