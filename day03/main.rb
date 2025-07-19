def part1(input)
  input
    .scan(/mul\((\d+),(\d+)\)/)
    .sum {|a, b| a.to_i * b.to_i}
end

def part2(input)
  total = 0
  skip = false

  input.scan(/(do\(\)|don't\(\)|mul\((\d+),(\d+)\))/) do |match|
    instruction, num1, num2 = match
    
    case instruction
    when "do()"
      skip = false
    when "don't()"
      skip = true
    when "mul"
      unless skip
        total += num1.to_i * num2.to_i
      end
    end
  end

  total
end

# part 1
input1 = File.read("input1.txt")
p part1(input1) # 161

# part 2
input2 = File.read("input2.txt")
p part2(input2) # 48