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

--main = print (filterPos myIntList) -- Cons 2 (Cons 5 Empty)

-- The changing part is the predicate that test each element

filterIntList :: (Int -> Bool) -> IntList -> IntList
filterIntList _ Empty = Empty
filterIntList p (Cons x xs)
    | p x = Cons x (filterIntList p xs)
    | otherwise = filterIntList p xs

--main = print (filterIntList (>0) myIntList)



-- ----------------------
-- Polymorphism
-- ----------------------

-- Problem with previous examples : works only for lists of Int.
-- For lists of Integer, String, Bool, whatever, we would need to make
--  ... a new data type and reimplement similar functions where only their type signature would differ.
-- Enter polymorphism.


-- Polymorphic data types

-- t is a type variable. This construct can be a list of any type
data List t = E | C t (List t) deriving Show

lst1 :: List Int
lst1 = C 1 (C 2 (C 3 E))

lst2 :: List Char
lst2 = C 'a' (C 'b' (C 'c' E))

lst3 :: List Bool
lst3 = C True (C False E)

-- Polymorphic functions

filterList :: (t -> Bool) -> List t -> List t
filterList _ E = E
filterList p (C x xs)
    | p x       = C x (filterList p xs)
    | otherwise = filterList p xs

myList = C 2 (C (-3) (C 5 E))

--main = print (filterList even myList) -- C 2 E

-- Using different a and b type variables because we may want to return different types than the one use on input
mapList :: (a -> b) -> List a -> List b
mapList _ E         = E
mapList f (C x xs)  = C (f x) (mapList f xs)

--main = print (mapList (*2) myList) -- C 4 (C (-6) (C 10 E))



-- ----------------------
-- Total and Partial Functions
-- ----------------------

-- Partial functions are functions that crashes for certain inputs. BAD !
-- Total functions are functions that works for ALL possible inputs. GOOD !

-- core head, tail, init, last and !! are partial : they crash on empty lists

-- One solution : wrap the result type as a Maybe type
-- reminder : data Maybe a = Nothing | Just a
--data Maybe a = Nothing | Just a

-- Important here : as `head` crashes because empty lists have no type,
--  ... we need create a "typed" empty list
emptyStringList = [] :: [String]

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

main = print (safeHead emptyStringList, safeHead ["Hello"])

-- Other solution : when we KNOW that empty lists won't be passed,
--  ... then the types ought to reflect that guarantee !

data NonEmptyList a = NEL a [a] deriving Show

nelToList :: NonEmptyList a -> [a]
nelToList (NEL x xs) = x:xs

--main = print (nelToList (NEL 1 []) -- [1]
--main = print (nelToList (NEL 1 [1]) -- [1,1]

listToNEL :: [a] -> Maybe (NonEmptyList a)
listToNEL [] = Nothing
listToNEL (x:xs) = Just (NEL x xs)

--main = print (listToNEL []) -- Nothing
--main = print (listToNEL [1,2]) -- Just (NEL 1 [2])

headNEL :: NonEmptyList a -> a
headNEL (NEL x _) = x

main = print headNEL (NEL 1 [2]) -- 1
main = print headNEL (NEL 1 [2,3,4,5,6]) -- 1
main = print headNEL (NEL [1] [[2], [3]]) -- [1]
main = print headNEL (listToNEL [1,2]) -- Error : listToNEL [a] wraps the result as a Maybe type, so signatures don't match

tailNEL :: NonEmptyList a -> [a]
tailNEL (NEL _ xs) = xs