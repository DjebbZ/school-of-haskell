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
main = print (i `div` i)

-- Conclusion : No implicit conversion of numeric types