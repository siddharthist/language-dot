module Main where

import Distribution.Simple (defaultMainWithHooks, simpleUserHooks, runTests)
import System.Process      (system)

main :: IO ()
main =
    defaultMainWithHooks $ simpleUserHooks { runTests = runTests' }
  where
    runTests' _ _ _ _ = do
        system "runhaskell -DTEST -i./src src/test.hs"
        return ()
