require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

start1 = Startup.new("WeWork", "Tim", "space")
start2 = Startup.new("Amazon", "Brezos", "retail")
start3 = Startup.new("Apple", "Steve", "tech")

vc1 = VentureCapitalist.new("Bob", 2000000000)
vc2 = VentureCapitalist.new("Raul", 500)
vc3 = VentureCapitalist.new("Alex", 55000000000)

fr1 = FundingRound.new(start1, vc2, "Angel", 202020200)
fr2 = FundingRound.new(start3, vc1, "Seed", 3333333333333)
fr3 = FundingRound.new(start2, vc3, "Series A", 555555555555)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line