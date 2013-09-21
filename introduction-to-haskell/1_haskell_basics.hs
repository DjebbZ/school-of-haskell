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

--main = print [isEven 2, isEven' 5]



-- ----------------------
-- Pairs
-- ----------------------

p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x,y) = x + y

--main = print (sumPair(3,4))
--main = print ("sumPair(3,4) = " ++ show (sumPair (3,4))) -- Improvised this one



-- ----------------------
-- Constructing Lists
-- ----------------------

emptyList = []
a = 1:[] -- : is called the "cons" operator
b = 2:(1:[]) -- [2,1]
c = [2,3,4] == 2:3:4:[] -- True, left side is syntactic sugar of right side

--main = print b

-- reusing the hailstone function from above
-- list constructed using ":" and recursion
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

--main = print (hailstoneSeq 5) -- [5,16,8,4,2,1]



-- ----------------------
-- Functions on Lists
-- ----------------------

-- compute the length of list of Integers
intLisLength :: [Integer] -> Integer
intLisLength []     = 0
--intLisLength (x:xs) = 1 + intLisLength xs -- x is useless here
intLisLength (_:xs) = 1 + intLisLength xs -- so it's replaced by _

--main = print (intLisLength [1,2,3,4,5,6,7,8,9]) -- 9

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []          = []
sumEveryTwo (x:[])      = []
sumEveryTwo (x:y:zs)    = (x + y) : sumEveryTwo zs

main = print (sumEveryTwo [1,2,3,4,5]) -- [3,7]
