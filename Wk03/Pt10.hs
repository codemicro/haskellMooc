-- Wk03x10 - Grow a tree

data Tree = Leaf | Node Int Tree Tree deriving Show
-- In this, Tree can be thought of kinda like an interface in Go, where both Leaf and Node fit that interface.

-- maxTreeDepth will find the maximum depth to the bottom of a binary tree
maxTreeDepth :: Tree -> Int 
maxTreeDepth Leaf = 0
maxTreeDepth (Node _ branchLeft branchRight) = -- this is unpacking positional values
    1 + max (maxTreeDepth branchLeft) (maxTreeDepth branchRight)

-- treeSum will find the sum of all the values contained within each node
treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node val branchLeft branchRight) = val + treeSum branchLeft + treeSum branchRight

-- isTreeSorted is the only function in this file I didn't initially write out before looking at the given solution
-- A leaf is assumed to be sorted by default since it signifies the end of a branch
-- "The data structure invariant we want is that, for any Node storing value x, all values in its left subtree are < x, and all values in its right subtree are >= x."
isTreeSorted :: Tree -> Int -> Int -> Bool
isTreeSorted Leaf _ _ = True 
isTreeSorted (Node x leftSubtree rightSubtree) minVal maxVal =
    let leftSorted   = isTreeSorted leftSubtree minVal x
        rightSorted = isTreeSorted rightSubtree x maxVal
    in x >= minVal && x< maxVal && leftSorted && rightSorted
