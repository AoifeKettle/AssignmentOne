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

  show_tree :: Tree a -> a -> a -> Bool
  show_tree (Node v tl tr) n1 n2 = True
  show_tree Empty _ _ = False
