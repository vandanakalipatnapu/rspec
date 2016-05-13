class StudentsController < ApplicationController
	def new
		@colleges = College.all
		@student = Student.new
	end

	def create
		@colleges = College.all
		@student = Student.new(student_params)
      if @student.save
       	render json: {success: true,message: "student has been created",student: @student}
       	# redirect_to students_path
      else
      	render json: {success: true,message: "student has not been created",errors: @student.errors.full_messages}
      	# render "new"
      end
    
	end

	def index
		# @college = College.find(params[:college_id])
		@colleges = College.all
		@students = Student.all
		render json: {success: true,message: "All students",students: @students}
		# @student = Student.find(params[:id])
		# @college = @student.college.id
	end

	def show
		@colleges = College.all
		@student = Student.find(params[:id])
		# raise @student.college_id.inspect
		@college = College.find_by(params[@student.college_id])
		render json: {success: true,message: "required student",student: @student}
	end

	def edit
		@colleges = College.all
		@student = Student.find(params[:id])
	end

	def update
		@colleges = College.all
		@student = Student.find(params[:id])
		if @student.update(student_params)
			render json: {success: true,message: "student has been updated",student: @student}
		else
			render json: {success: false,message: "student has not been updated",errors: @student.errors.full_messages}
		end
	end

	def destroy
		@colleges = College.all
		@student = Student.find(params[:id])
		if @student.destroy
			render json: {success: true,message: "student has been deleted",student: @student}
		else
			render json: {success: false,message: "student has not been deleted",errors: @student.errors.full_messages}
		end	
	end

	private
		def student_params
			params.permit(:name,:email,:dob,:age,:college_id)
		end
end
