def fibs(n)
  return [0] if n == 1
  result = [0, 1]
  (n-2).times { |i| result.push(result[-1] + result[-2])}
  return result
end
p fibs(8)

def fibs_rec(n)
  if n <= 2
    return [0, 1][0..n-1]
  else 
    sequence_array = fibs_rec(n-1)
    sequence_array << sequence_array[-1] + sequence_array[-2]
    return sequence_array
  end
end

p fibs_rec(8) 

def merge(left_array, right_array)
  return right_array if left_array.empty?
  return left_array if right_array.empty?

  smallest_number = if left_array.first <= right_array.first
    left_array.shift
  else
    right_array.shift
  end

  recursive = merge(left_array, right_array)

  [smallest_number].concat(recursive)
end

def merge_sort(array)
  if array.length <= 1
    return array
  end

  left = array[0..(array.length / 2 - 1)]
  right = array[(array.length / 2)..-1]
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)
end

array = [3, 2, 1, 13, 8, 5, 0, 1]
p merge_sort(array)