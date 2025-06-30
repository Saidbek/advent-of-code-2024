def total_distance(input)
  left, right = parse(input).map(&:sort)

  left
    .zip(right)
    .sum {|x, y| (x - y).abs}
end

def similarity_score(input)
  left, right = parse(input)
  right_counts = right.tally

  left
    .sum {|num| num * right_counts.fetch(num, 0) }
end

def parse(input)
  input
    .split("\n")
    .map(&:split)
    .transpose
    .map {|column| column.map(&:to_i)}
end

input = File.read("inputs/input01.txt")

# part 1
puts total_distance(input)

# part 2
puts similarity_score(input)