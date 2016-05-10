json.(@college,:name,:email,:location,:phno)


json.students @college.students do |student|
	json.(student,:name,:email,:college_id,:age,:dob)
end

json.(@student,:name,:email,:college_id,:age,:dob)