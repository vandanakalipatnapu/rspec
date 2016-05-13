class College < ActiveRecord::Base
	has_many :students

	validates :name, presence: true, uniqueness: true, format: {with: /\A[a-zA-Z|\s]+\Z/}
    validates :location, presence: true
    validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
    validates :phno, presence: true, numericality: true, length: {minimum:10 , maximum:10}
end
