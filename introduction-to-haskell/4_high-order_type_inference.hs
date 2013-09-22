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
greatherThan100'' xs filter (>100) xs

