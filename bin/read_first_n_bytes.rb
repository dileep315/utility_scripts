require "bundler/setup"
require "utility_scripts"
require 'csv'

#================================USAGE====================================================
# bundle exec ruby read_first_n_bytes.rb ~/Downloads/myfile.csv 10000
# ========================================================================================

file_name = ARGV[0]
n = ARGV[1].to_i
file_path = File.expand_path(file_name)

File.open(file_path) do |f|
  i = 0
  f.each_byte do |ch|
      i += 1
      break if i > n
      puts sprintf("%02x", ch).upcase
  end
end

# fd = IO.sysopen(file_path)
# io = IO.new(fd)
# result = io.sysread(n)
# result.each_char do |char|
#   p "#{char.hex}"
# end
#
# puts '\n'