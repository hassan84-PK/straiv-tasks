def print_result(result)
	result.each_pair { |k, v| puts "#{k} => #{v}"}
end


values = ['bed', 'pillow', 'bed', 'pillow', 'table', 'bed',
			 'pillow', 'door', 'light', 'minibar', 'light', 
			 'chair', 'chair', 'light', 'light', 'hairdryer', 'soap']

print_result(values.tally.sort_by { |_,v| v }.reverse.to_h) 

#other method which can be used is:
print_result(values.tally.sort_by(&:last).reverse.to_h)
