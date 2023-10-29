class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var sum = 1
        var out: [Int] = []
        for i in 0..<nums.count {
            out.append(sum)
            sum *= nums[i]
        }
    
        sum = 1
        for i in 0..<nums.count {
            let tmp = nums[nums.count - 1 - i]
            out[nums.count - 1 - i] *= sum
            sum *= tmp
        }
    
        return out
    }
}