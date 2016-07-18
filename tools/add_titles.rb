#!/usr/bin/env ruby

# print all the lines in every file passed via command line that contains login
count = 1
ARGF.each do |line|
  if line =~ /#/
    line = "# #{count}"
    count += 1
  end
  puts line
end

