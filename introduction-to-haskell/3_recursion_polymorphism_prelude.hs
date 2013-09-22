-- ----------------------
-- Recursion Patterns
-- ----------------------


-- Map : perform some operation on every element of the list


data IntList = Empty | Cons Int IntList deriving Show

addOneToAll :: IntList -> IntList
addOneToAll Empty = Empty
addOneToAll (Cons x xs) = Cons (x + 1) (addOneToAll xs)

myIntList = Cons 2 (Cons (-3) (Cons 5 Empty))

--main = print (addOneToAll myIntList) -- Cons 3 (Cons (-2) (Cons 6 Empty))

absAll :: IntList -> IntList
absAll Empty = Empty
absAll (Cons x xs) = Cons (abs x) (absAll xs)

--main = print (absAll myIntList) -- Cons 2 (Cons 3 (Cons 5 Empty))

squareAll :: IntList -> IntList
squareAll Empty = Empty
squareAll (Cons x xs) = Cons (x * x) (squareAll xs)

--main = print (squareAll myIntList) -- Cons 4 (Cons 9 (Cons 25 Empty))

-- The changing part is the function applied to each element of the list

mapIntList :: (Int -> Int) -> IntList -> IntList
mapIntList _ Empty = Empty
mapIntList f (Cons x xs) = Cons (f x) (mapIntList f xs)

addOneToAll' :: IntList -> IntList
addOneToAll' xs = mapIntList (+1) xs

absAll' :: IntList -> IntList
absAll' xs = mapIntList abs xs

squareAll' :: IntList -> IntList
squareAll' xs = mapIntList (^2) xs

--main = print (addOneToAll' myIntList) -- Cons 3 (Cons (-2) (Cons 6 Empty))
--main = print (absAll' myIntList) -- Cons 2 (Cons 3 (Cons 5 Empty))
--main = print (squareAll' myIntList) -- Cons 4 (Cons 9 (Cons 25 Empty))


-- Filter


filterPos :: IntList -> IntList
filterPos Empty = Empty
filterPos (Cons x xs)
    | x > 0         = Cons x (filterPos xs)
    | otherwise    = filterPos xs

main = print (filterPos myIntList) -- Cons 2 (Cons 5 Empty)

-- The changing part is the predicate that test each element

filterIntList :: (Int -> Bool) -> IntList -> IntList
filterIntList _ Empty = Empty
filterIntList p (Cons x xs)
    | p x = Cons x (filterIntList p xs)
    | otherwise = filterIntList p xs

main = print (filterIntList (>0) myIntList)