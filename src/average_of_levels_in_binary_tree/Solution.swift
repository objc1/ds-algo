public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var res: [Double] = []
    var count: [Int] = []
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        traverse(root, 0)
        
        for i in 0..<res.count {
            res[i] /= Double(count[i])
        }
        
        return res
    }
    
    func traverse(_ root: TreeNode?, _ level: Int) {
        guard let root = root else { return }
        
        if res.count < level + 1 {
            res.append(Double(root.val))
            count.append(1)
        } else {
            res[level] += Double(root.val)
            count[level] += 1
        }
        
        traverse(root.left, level + 1)
        traverse(root.right, level + 1)
    }
}

var solution = Solution()
var root = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
print(solution.averageOfLevels(root))
