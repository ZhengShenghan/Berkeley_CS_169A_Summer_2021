# Line = Struct.new(:time, :type, :msg)
# LOG_FORMAT = /(\d{2}:\d{2}) (\w+) (.*)/
# def parse_line(line)
#   line.match(LOG_FORMAT) { |m| Line.new(*m.captures) }
# end
# puts parse_line("12:41 INFO User has logged in.")
# A = "12342SXFFS1324"
# puts A.match /\d+/
# puts "s sss 1233".match?(/a-z/x)
# This produces objects like this:
#
address = '[#<Google::Apis::CivicinfoV2::SimpleAddressType:0x0000558c085ed6e0 @city="Sacramento", @line1="1430 N Street", @state="CA", @zip="95814">]'
temp = address.split(/"([^"]*)"/)
a = false and true
print(a)