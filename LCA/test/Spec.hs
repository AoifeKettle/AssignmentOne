{-# LANGUAGE StandaloneDeriving #-}

module Main where

import Test.HUnit
import Test.Framework as TestFramework (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)

import Lib
-- HUnit Tests

testEmpty =  show_tree Empty 0 0@?= False

-- QuickCheck Tests

main = defaultMain tests

tests :: [TestFramework.Test]
tests = [ testGroup "Tests" [testCase "emptyTree" testEmpty]]
