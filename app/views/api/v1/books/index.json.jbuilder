json.array!(@books) do |e|
	json.id e.id
	json.name e.name
	json.description e.description
	e.authors.each do |a|
		json.first_name a.first_name
		json.family_name a.family_name
		json.phone_number a.phone_number
		json.date_of_birth a.date_of_birth
	end
end