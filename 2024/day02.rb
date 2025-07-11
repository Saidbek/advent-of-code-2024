def count_safes(input)
  parse_report(input)
    .count {|arr| monotonic?(arr)}
end

def count_safes_with_dampener(input)
  parse_report(input)
    .count {|arr| monitonic_with_one_removal?(arr)}
end

def monotonic?(report)
  increasing = report.each_cons(2).all? {|a, b| (b - a).between?(1, 3)}
  decreasing = report.each_cons(2).all? {|a, b| (a - b).between?(1, 3)}
  increasing || decreasing
end

def monitonic_with_one_removal?(report)
  return true if monotonic?(report)
  (0...report.length).any? do |i|
    arr = report.dup
    arr.delete_at(i)
    monotonic?(arr)
  end
end

def parse_report(input)
  input
    .split("\n")
    .map(&:split)
    .map {|arr| arr.map(&:to_i)}
end

input = File.read("./inputs/input02.txt")

# part 1
p count_safes(input)

# part 2
p count_safes_with_dampener(input)