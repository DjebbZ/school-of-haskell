-- ----------------------
-- Enumeration Type
-- ----------------------

data Thing = Shoe
            | Ship
            | SealingWax
            | Cabbage
            | King
    deriving Show
-- Thing is a type, with 5 data constructors

-- deriving means somehow "inherits behavior of"
-- Show Tells ghc to generate code to convert Thing to Sring.
-- `ghci` uses show to print values

shoe :: Thing
shoe = Shoe

--main = print shoe -- Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Ship, Cabbage]

--main = print listO'Things -- [Shoe, SealingWax, King, Ship, Cabbage]

-- pattern matchin on enumeration
isSmall :: Thing -> Bool
isSmall Shoe        = True
isSmall Ship        = False
isSmall SealingWax  = True
isSmall Cabbage     = False
isSmall King        = True

--main = print (isSmall King) -- True

-- smaller (and smarter) pattern matching
isSmall' :: Thing -> Bool
isSmall' Ship        = False
isSmall' Cabbage     = False
isSmall' _           = True -- like otherwise in guards

--main = print (isSmall' King) -- True



-- ----------------------
-- Enumeration Type
-- ----------------------

data FailableDouble = Failure | OK Double deriving Show

failed = Failure
ok = OK 3.4

--main = print (fail,ok) -- (Failure, OK 3.4)

-- FailableDouble has 2 data constructors
-- OK is not a FailableDouble, it needs a Double
-- OK 3.4 :: FailableDouble
-- OK :: Double -> FailableDouble

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

--main = print (2 `safeDiv` 0, 3 `safeDiv` 4) -- (Failure,OK 0.75)

-- mapping failed computation to 0
failureToNumber :: FailableDouble -> Double
failureToNumber Failure = 0
failureToNumber (OK d)  = d

--main = print (failureToNumber failed, failureToNumber ok) -- (0.0,3.4)

-- data constructors can have more than one argument
-- giving
data Person = Person String Int Thing
    deriving Show

brent :: Person
brent = Person "Brent" 30 SealingWax

stan :: Person
stan = Person "Stan" 94 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a

--main = print (getAge brent) -- 30



-- ----------------------
-- Algebraic Data Types in General
-- ----------------------

-- the type AlgDataType can be constructed in one of four ways
-- type Constructor (= AlgDataType) and data Constructure (= ConstrX)
--  ... always start with a capital letter. Variables with lowercase letter.
--data AlgDataType = Constr1 Type11 Type12
--                 | Constr2 Type21
--                 | Constr3 Type31 Type32 Type33
--                 | Constr4

watsYourName :: Person -> String
watsYourName p@(Person n _ _ ) = "The name field of (" ++ show p ++ ") is " ++ n
-- x@pat to retain the whole pattern in a variable

--main = putStrLn (watsYourName brent) -- The name field of (Person "Brent" 30 SealingWax) is Brent
-- putStrLn instead of print because it's already a string
--main = print (watsYourName brent) -- "The name field of (Person \"Brent\" 30 SealingWax) is Brent"
-- wraps result in double quotes, so it escape the quotes already present



-- ----------------------
-- Case Expressions
-- ----------------------

-- case expression is the fundamental construct for doing pattern matching
value = case "Hello" of
    []      -> 0        -- not matched, try next
    ('H':s) -> length s -- matched, returns 4
    _       -> 7        -- would match but is never reached

-- pattern matching in function is just syntactic sugar for case expressions
failureToNumber' :: FailableDouble -> Double
failureToNumber' x = case x of
    Failure -> 0
    OK d    -> d

--main = print (failureToNumber' failed, failureToNumber' ok) -- (0.0,3.4)



-- ----------------------
-- Recursive Data Types
-- ----------------------

-- Built-in [] is recurisve, it's constructed from an element and a list with the rest :
-- (pseudo-code) data List = x:List
-- Cons would be ":", Empty would be [], IntList would be [Int]
data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x xs) = x * intListProd xs

--main = print (intListProd (Cons 3 (Cons 2 (Cons 4 Empty)))) -- 24

-- equivalent with built-in types
intListProd' :: [Int] -> Int
intListProd' [] = 1
intListProd' (x:xs) = x * intListProd' xs

--main = print (intListProd' [3,2,4]) -- 24

data Tree = Leaf Char
            | Node Tree Int Tree
    deriving Show

tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))

main = print tree -- Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))
