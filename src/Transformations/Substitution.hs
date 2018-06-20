{-|
Module      : Transformations.Substitution
Description : Substitutions (from a to a)
Copyright   : (c) 2017 Pascal Poizat
License     : Apache-2.0 (see the file LICENSE)
Maintainer  : pascal.poizat@lip6.fr
Stability   : experimental
Portability : unknown
-}

module Transformations.Substitution (Substitution(..)
                                    ,apply
                                    ,boundvariables
                                    ,freevariables
                                    ,isBound
                                    ,isFree)

where

import           Data.Map (findWithDefault, fromList, keys)

{-|
A substitution from a to a
-}
type Substitution a = [(a,a)]

{-|
Apply a substitution.
-}
apply :: Ord a => Substitution a -> a -> a
apply s a = findWithDefault a a $ fromList s

{-|
Variables bound by a substitution.
-}
boundvariables :: Ord a => Substitution a -> [a]
boundvariables = keys . fromList

{-|
Variables of a list free wrt a substitution.
-}
freevariables :: Ord a => Substitution a -> [a] -> [a]
freevariables s = filter (isFree s)

{-|
Check if a variable is bound.
-}
isBound :: Ord a => Substitution a -> a -> Bool
isBound s = flip elem (boundvariables s)

{-|
Check if a variable is free.
-}
isFree :: Ord a => Substitution a -> a -> Bool
isFree s = not . isBound s

