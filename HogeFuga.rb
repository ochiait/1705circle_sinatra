for i in 1..100 do
  if i % 3 == 0 && i % 7 == 0
    puts "HOGE FUGA"
  elsif i % 3 == 0
    puts "HOGE"
  elsif i % 7 == 0
    puts "FUGA"
  else
    puts i
  end
end
