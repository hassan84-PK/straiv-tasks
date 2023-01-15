# frozen_string_literal: true

def print_result(result)
  result.each { |value| puts "#{value.first} => #{value.last}" }
end

def sort_and_reverse_result(result)
  result.sort_by { |_, v| v }.reverse
end

values = %w[bed pillow bed pillow table bed
            pillow door light minibar light
            chair chair light light hairdryer soap]

print_result(sort_and_reverse_result(values.tally))

# other approach which can be used is:
puts 'Single Line Solution'
print_result(values.tally.sort_by(&:last).reverse)
