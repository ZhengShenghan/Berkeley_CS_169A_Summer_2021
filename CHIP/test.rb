def binary_multiple_of_4? s
  # YOUR CODE HERE
  s = s.delete("\s\n")
  if s.length == 1 and s == "0"
    return true
  end
  if s.length >=2 and s.delete('01') == '' and s[-2,-1] == "00"
    return true
  end

end
puts binary_multiple_of_4?("101010100")