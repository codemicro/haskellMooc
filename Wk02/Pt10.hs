-- This file can be loaded into GHCi using `:load Pt10.hs`

-- simple factorial function
fact :: Int -> Int 
fact 0 = 1
fact n = n * fact(n-1)

-- make people noble
makeNoble :: Bool -> String -> String 
makeNoble f name = (if f then "Dame " else "Sir ") ++ name