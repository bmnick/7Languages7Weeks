puts "each"
a = []
(1..16).each do |i|
  a << i
  p a if a.size % 4 == 0
  a.clear if a.size % 4 == 0
end

puts "each_slice"
(1..16).each_slice(4) {|a| p a }