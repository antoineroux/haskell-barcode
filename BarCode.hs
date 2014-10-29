module BarCode where

-- We will produce a basic module that checks bar codes and creates an value
-- with a corresponding type.

-- First of all, let's define a few types.

-- "type" just defines an alias for an existing type. It just makes the code 
-- more readable.
type Zone = [Integer]
type CompanyCode = [Integer]
type ItemRef = [Integer]
type CheckDigit = Integer

-- "data" creates a new (algebraic) data type. Here we have a sum type: EAN8 and
-- EAN 13 are constructors. 
data EAN = EAN8 Zone ItemRef CheckDigit 
		 | EAN13 Zone CompanyCode ItemRef CheckDigit


-- An EAN 8 code bar is made of 8 digits:
--		Zone: 2 digits.
--		Item reference: 5 digits.
-- 		Check digit: a single digit to check the previous one.
-- 
-- To validate a bar code, you multiply each of the first 7 digits by its weight
-- 		Digits: 	1 	2 	3 	4 	5 	6 	7
--      Weights:	3 	1 	3 	1 	3 	1 	3
-- 
-- Then you sum all the results, take the rest of the division by 10 and you
-- you substract it from ten. The result should be equal to the check digit.
-- For instance, for the code 4719512x
-- 		Bar code:   4 	7 	1 	9 	5 	1 	2
-- 		Weights:	3 	1 	3 	1 	3 	1 	3
-- 		Results: 	12 	7 	3 	9 	15 	1 	6
--		Sum: 53
--		Check digit: 7, the code should be 4719-5127

-- Write a function checkDigit that computes the corresponding check digit. You
-- can assume that the list will always contain 7 integers.
checkDigitEAN8 :: [Integer] -> Integer
checkDigitEAN8 xs = undefined

-- Write a function that validates an EAN8. For that, you can use guards.
isValidEAN8 :: [Integer] -> Bool
isValidEAN8 xs = undefined

-- A few valid EAN 8 codes that you can try: 4719-5127, 6583-3254, 5012, 3476.

-- EAN 13 is the one most familiar to us, the one we see on most products. It is
-- made of 13 digits:
--		Zone: 2 digits.
--		Company code: 4 digits.
--		Item reference: 6 digits.
-- 		Check digit: a single digit to check the previous one.
-- 
-- The weights are different than from EAN 8:
-- 		Digits:		1 	2 	3 	4 	5 	6 	7 	8 	9 	10 	11 	12
-- 		Weights:	1 	3 	1 	3 	1 	3 	1 	3 	1 	3 	1 	3
--
-- Then the check digit is calculated the same way, but with those weights.

-- First, write a function checkDigitEAN13 that computes the check digit in that
-- case.
checkDigitEAN13 :: [Integer] -> Integer
checkDigitEAN13 xs = undefined

-- Then write the corresponding isvalidEAN13 function.
isValidEAN13 :: [Integer] -> Bool
isValidEAN13 xs = undefined

-- Now, let's say the digits were read by a bar code scanner and they are passed
-- to you. If digits read are valid, then you should return the correct instance
-- of EAN. If they are invalid then you should return... Nothing.
readEAN :: [Integer] -> Maybe EAN
readEAN digits = undefined