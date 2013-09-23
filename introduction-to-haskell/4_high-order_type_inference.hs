-- ----------------------
-- Anonymous functions
-- ----------------------

greatherThan100 :: [Integer] -> [Integer]

-- 3 ways to implement it

-- with functions
gt100 :: Integer -> Bool
gt100 x = x > 100

greatherThan100 xs = filter gt100 xs

-- Problem if we never use gt100 again, it's useless to define

-- with lambdas
greatherThan100' :: [Integer] -> [Integer]
greatherThan100' xs = filter (\x -> x > 100) xs

-- with operator sections, aka "partially applied operators" (me)
greatherThan100'' :: [Integer] -> [Integer]
greatherThan100'' xs = filter (>100) xs



-- ----------------------
-- Currying and partial application
-- ----------------------

-- All functions take only one argument. When specifying several, like
myFunc :: Int -> Int -> Int
myFunc x y = x + y
-- It really takes one and returns a function that takes one that returns the final answer.
-- The previous declaration is similar to :
myFunc' :: Int -> (Int -> Int)
myFunc' x y = x + y

-- The multi-arguments lambda notation,
-- \x y z -> ...
-- is just syntactic sugar for
-- \x -> (\y -> (\z -> ... ))

-- The multi arguments function defintion,
-- f x y z = ...
-- is sugar for
-- f = \x -> (\y -> (\z -> ... ))

-- Representing multi-arguments functions as one-argument functions that returns functions = CURRYING

-- To represent a function that takes 2 arguments, use a tuple (= a pair)
f2 :: (Int, Int) -> Int
f2 (x,y) = 2*x + y



-- ----------------------
-- Wholemeal programming
-- ----------------------

foobar :: [Integer] -> Integer
foobar [] = 0
foobar (x:xs)
    | x > 3     = (7*x + 2) + foobar xs
    | otherwise = foobar xs

--main = print (foobar [1,2,3,4,5]) -- 67

-- Seems straightforward, but not idiomatic Haskell :
-- - too low level
-- - doing too much at once
-- - not making incremental transformation with the recursion patterns provided by Haskell

-- Could be rewritten like this :
foobar' :: [Integer] -> Integer
foobar' = sum . map (\x -> 7*x + 2) . filter (>3)

main = print (foobar' [1,2,3,4,5]) -- 67

-- Not specifying functions arguments, aka defining what a function is, is "point-free" style

