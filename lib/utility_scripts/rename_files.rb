require 'fileutils'
Dir.glob('/Users/dileep.reddy/Udaan-Workspace/udaan-ratings/cronjobs/*.yml') do |filen|
  basename = File.basename(filen)
  FileUtils.move(filen, "/Users/dileep.reddy/Udaan-Workspace/udaan-ratings/cronjobs/#{basename}.yaml")
end
