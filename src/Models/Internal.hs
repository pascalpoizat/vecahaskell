-----------------------------------------------------------------------------
-- |
-- Module      :  Models.Internal
-- Copyright   :  (c) 2017 Pascal Poizat
-- License     :  Apache-2.0 (see the file LICENSE)
--
-- Maintainer  :  pascal.poizat@lip6.fr
-- Stability   :  experimental
-- Portability :  unknown
--
-- A class for events with a subset of internal events.
-----------------------------------------------------------------------------

module Models.Internal (
  Internal(..)
  )
where

{- |
Minimal definition: 'isInternal'.
-}
class Internal p where
  {-# MINIMAL isInternal #-}
  isInternal :: p -> Bool
