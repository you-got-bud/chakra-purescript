module Accordion where

import Prelude
import React.Basic.Hooks
import Effect (Effect)

data IntOrArrayOfInt = Int | Array Int

type AccordionProps = {
  -- | Allow multiple accordion items to be expanded at once
  allowMultiple :: boolean
  -- | Allow the accordion items to be expanded and collapsed
  allowToggle :: boolean
  -- | The index(s) of the expanded accordion items
  index :: IntOrArrayOfInt
  -- | The initial indexes of the accordion item
  defaultIndex :: IntOrArrayOfInt
  -- | The callback invoked when accordion items are expanded and collapsed
  onChange :: IntOrArrayOfInt -> Effect
  }

foreign import Accordion :: reactComponentWithChildren AccordionProps
