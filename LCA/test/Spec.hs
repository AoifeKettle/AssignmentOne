{-# LANGUAGE StandaloneDeriving #-}

module Main where

import Test.HUnit
import Test.Framework as TestFramework (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)

import Lib
-- HUnit Tests

testEmpty =  show_tree Empty [] @?= False
testNonEmpty =  show_tree tree1 [1, 3] @?= True
testLCAEmpty = lca Empty 0 0@?= Left False
testLCANotPresent = lca tree1 0 0 @?= Left False
testLCAPresent = lca tree1 4 5 @?= Right 2

testEmptyBuild = show_tree Empty [] @?= False
testBuild = show_tree tree1 [1, 3] @?= True

lcatrue = lca tree1 4 2@?= Right 2

lcafalsesingletontree = lca tree1 13 13 @?= Left False
lcatreeempty = lca tree1 0 0 @?= Left False

-- QuickCheck Tests

main = defaultMain tests

tests :: [TestFramework.Test]
tests = [ testGroup "BasicTestsSampleCode" [testCase "emptyTree" testEmpty,
                              testCase "nonEmptyTree" testNonEmpty,
                              testCase "notPresentLCA" testLCANotPresent,
                              testCase "LCAEmpty" testLCAEmpty,
                              testCase "LCAPresent" testLCAPresent],

              testGroup "Test tree build" [testCase "Build empty tree" testEmptyBuild,
                                              testCase "Build full tree" testBuild],

              testGroup "Test LCA True" [testCase "LCA in tree" lcatrue],
              testGroup "Test LCA False" [testCase "LCA empty tree" lcatreeempty,
                                        testCase "LCa not in singleton tree" lcafalsesingletontree]]
