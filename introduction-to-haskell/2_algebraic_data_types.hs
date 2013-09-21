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

main = print (isSmall' King) -- True
