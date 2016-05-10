class Student < ActiveRecord::Base
	belongs_to :college

	validates :name,presence:true,uniqueness:true,format:{with:/\A[a-zA-Z]+\z/,message:"enter valid name"}
	validates :email,presence:true,uniqueness:true,format:{with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,message:"enter valid email"}
	validates :dob,presence:true,format:{with:/\d{2}\-\d{2}\-\d{4}/,message:"dob must be in format"}
	validates :age,presence:true,numericality:true
	validates :college_id,presence:true,numericality:true
end
