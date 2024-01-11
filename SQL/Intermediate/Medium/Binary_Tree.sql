/* You are given a table, BST, containing two columns:
N and P,where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node.
Output one of the following for each node:
    Root: If node is root node.
    Leaf: If node is leaf node.
    Inner: If node is neither root nor leaf node.
*/

SELECT b.n,
    CASE
        WHEN b.p IS NULL
        THEN 'Root'
        ELSE
            CASE
                WHEN (SELECT COUNT(*) FROM bst WHERE p = b.n) = 0
                THEN 'Leaf'
                ELSE 'Inner'
            END      
    END

FROM bst b

ORDER BY b.n
;