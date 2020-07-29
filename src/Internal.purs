module Chakra.Internal where

import React.Basic (JSX)

-- | Helper type for a props which contain jsx for the children
type WithChildren p
  = ( children :: JSX | p )
