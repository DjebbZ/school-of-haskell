-- ----------------------
-- Aithmetic
-- ----------------------

i = 30 :: Int
j = 10 :: Integer
--main = print (i + (fromInteger j))
-- Error because `+` works on values of same numeric type

x = 20 :: Int
--main = print (i / i)
-- Error because `/` performs floating-point division only
--main = print (i `div` i)

-- Conclusion : No implicit conversion of numeric types



-- ----------------------
-- Boolean Logic
-- ----------------------

ex1 = True && False -- False of course
ex2 = not (False || True) -- True
ex3 = ('a' == 'a')
ex4 = 16 /= 3 -- works with and without parentheses
ex5 = "Haskell" > "C++" -- True

--main = print ex5



-- ----------------------
-- Defining Basic Functions
-- ----------------------

-- function's type
sumtorial :: Integer -> Integer
-- pattern matching
sumtorial 0 = 0
sumtorial n = n + sumtorial (n - 1)

--main = print (sumtorial 10)

hailstone :: Integer -> Integer
-- using guards (i.e. pattern matching with Boolean expresions)
hailstone n
    | n `mod` 2 == 0    = n `div` 2
    | otherwise         = 3 * n + 1

--main = print (hailstone 3)

isEven :: Integer -> Bool
isEven n
    | n `mod` 2 == 0    = True
    | otherwise         = False

-- too complicated. Much simpler to write
isEven' :: Integer -> Bool
isEven' n = n `mod` 2 == 0

main = print [isEven 2, isEven' 5]