module Lib where

  import Text.Printf

  data Tree a = Empty | Node a (Tree a) (Tree a) deriving Show

--construct BinaryTree recursively
  tree1 :: Tree Int
  tree1 = Node 1
      (Node 2
          (Node 4 Empty Empty)
          (Node 5 Empty Empty))
      (Node 3
          (Node 6 Empty Empty)
          (Node 7 Empty Empty))

  --find LCA
  lca :: Eq a => Tree a -> a -> a -> Either Bool a
  lca Empty _ _ = Left False
  lca (Node v treeleft treeright) n1 n2 =
      let left = lca treeleft n1 n2
          right = lca treeright n1 n2
          onroot = v == n1 || v == n2
      in case (left, right, onroot) of
          (Right a  , _         , _    ) -> Right a
          (_        , Right a   , _    ) -> Right a
          (Left True, Left True , _    ) -> Right v
          (Left True, _         , True ) -> Right v
          (_        , Left True , True ) -> Right v
          (Left True, _         , False) -> Left True
          (_         , Left True, False) -> Left True
          (_         , _        , True ) -> Left True
          _ -> Left False

  show_tree :: Tree a -> a -> a -> Bool
  show_tree (Node v treeleft treeright) n1 n2 = True
  show_tree Empty _ _ = False
