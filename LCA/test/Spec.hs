{-# LANGUAGE StandaloneDeriving #-}

module Main where

import Test.HUnit
import Test.Framework as TestFramework (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)

import Lib
-- HUnit Tests

testEmpty =  show_tree Empty [] @?= False
testNonEmpty =  show_tree tree1 [1, 3] @?= True
testLCAEmpty = lca Empty [] @?= Left False
testLCANotPresent = lca tree1 [0, 9] @?= Left False
testLCAPresent = lca tree1 [4, 5] @?= Right 2

-- QuickCheck Tests

main = defaultMain testsBasic

testsBasic :: [TestFramework.Test]
testsBasic = [ testGroup "BasicTestsSampleCode" [testCase "emptyTree" testEmpty,
                              testCase "nonEmptyTree" testNonEmpty,
                              testCase "notPresentLCA" testLCANotPresent,
                              testCase "LCAEmpty" testLCAEmpty,
                              testCase "LCAPresent" testLCAPresent]]


testEmptyBuild = show_tree Empty [] @?= False
testBuild = show_tree tree1 [1, 3] @?= True

testBuildTree :: [TestFramework.Test]
testBuildTree = [testGroup "Test tree build" [testCase "Build empty tree" testEmptyBuild,
                                              testCase "Build full tree" testBuild]]
testLCAcalcTrue = lca tree1 [4, 5] @?= Right 4
testLCAcalcFalse = lca tree1 [6, 7] @?= Left False

testLCAcalc :: [TestFramework.Test]
testLCAcalc = [testGroup "Test tree build" [testCase "LCA not in tree" testLCAcalcTrue,
                                              testCase "LCa in tree" testLCAcalcFalse]]
