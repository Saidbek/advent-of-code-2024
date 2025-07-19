def part1(input)
  input
    .scan(/mul\((\d+),(\d+)\)/)
    .sum {|a, b| a.to_i * b.to_i}
end

def part2(input)
  total = 0
  skip = false

  instructions = input.scan(/(do\(\)|don't\(\)|mul\(\d+,\d+\))/).flatten

  instructions.each do |instruction|
    if instruction == "do()"
      skip = false
    elsif instruction == "don't()"
      skip = true
    elsif instruction.start_with?("mul") && !skip
      sum = instruction
        .scan(/mul\((\d+),(\d+)\)/)
        .flatten
        .map(&:to_i)
        .reduce(:*)

      total += sum
    else

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