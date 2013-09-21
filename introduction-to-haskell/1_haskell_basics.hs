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

main = print ex5

