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
    private var minLength: Int = 100000
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        traverse(root, 1)
        
        return minLength
    }
    
    private func traverse(_ root: TreeNode?, _ level: Int) {
        if root == nil { return }
        
        traverse(root?.left, level + 1)
        traverse(root?.right, level + 1)
        
        if root?.left == nil && root?.right == nil {
            minLength = min(minLength, level)
            return
        }
    }
}

var solution = Solution()
var root = TreeNode(1, TreeNode(2, TreeNode(4, TreeNode(6), nil), nil), nil)
print(solution.minDepth(root))
