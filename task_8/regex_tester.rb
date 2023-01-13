# frozen_string_literal: true

def generate_valid_password
  characters = []
  characters << ('a'..'z').to_a.sample(1)
  characters << ('A'..'Z').to_a.sample(1)
  characters << (0..9).to_a.sample(2)
  characters << %w[% ? @ + - _ / . ; > <].sample(2)
  characters.flatten.shuffle.join
end

def generate_password(valid)
  password = generate_valid_password
  password += generate_valid_password until password.length >= 12
  password += '!' unless valid
  password
end

# Check if password is valid
def valid_password?(password)
  password.match?(PASSWORD_REGEX)
end

puts 'This program will break when a valid password is printed'
# Password Regex
PASSWORD_REGEX = %r{^(?=.*[a-z])(?=.*[A-Z])(?=.*\d.*\d)(?=.*[%?@+\-_/.?;><])[a-zA-Z\d%?@+\-_/.?;><]{12,}$}.freeze
password = ''
until valid_password?(password)
  password = generate_password(rand(2).zero?)
  puts "Password: #{password}"
end
puts "Valid password: #{password}"
