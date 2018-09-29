
{-# LANGUAGE StandaloneDeriving #-}

module Main where

import Test.HUnit
import Test.Framework as TestFramework (defaultMain, testGroup, Test)
import Test.Framework.Providers.HUnit (testCase)

import Lib

-- HUnit Tests

test1 =  helloTest @?= "Hello World"

-- QuickCheck Tests

main = defaultMain tests

tests :: [TestFramework.Test]
tests = [ testGroup "Tests" [testCase "HelloWorld" test1]]
