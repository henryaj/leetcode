# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
    result = Array.new
    nums1 = nums1.sort

    nums2.each do |num|
        # for each number
        # attempt to find it in the first list
        found = binary_search(nums1, num)

        # if it is there, add it to the results list
        result << num if found
    end

    result
end

def binary_search(numbers, target)
    start_index = 0
    end_index = numbers.length - 1
    midpoint = end_index / 2

    if numbers.length == 0
        false
    elsif numbers[midpoint] == target
        numbers.delete_at(midpoint)
        true
    elsif numbers[midpoint] > target
        binary_search numbers[start_index, midpoint], target
    elsif numbers[midpoint] < target
        binary_search numbers[midpoint+1, end_index], target
    end
end

