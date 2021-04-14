require "bundler/setup"
require "utility_scripts"
require 'csv'

#================================USAGE====================================================
# bundle exec ruby find_lengthy_columns.rb ~/Downloads/myfile.csv 10000
# ========================================================================================

file_name = ARGV[0]
char_limit = ARGV[1].to_i
file_path = File.expand_path(file_name)

lengthy_columns = {}
CSV.foreach(file_path, headers: true, encoding: 'ISO-8859-1').with_index do |row, index|
  row.each do |(header, value)|
    if !value.nil? && value.size > char_limit
      lengthy_columns[header] ||= []
      lengthy_columns[header] << [index, value]
    end
  end
end

puts lengthy_columns
