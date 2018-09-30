module Main where

import Lib

main = mapM print [show_tree Empty 0 0,
                  show_tree tree1 0 9]
