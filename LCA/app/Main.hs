module Main where

import Lib

main = mapM print [show_tree Empty 0 0,
                  show_tree tree1 0 6,
                  show_tree tree1 3 6
                  ]


function = mapM print  [lca tree1 0 9]
