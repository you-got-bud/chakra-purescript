module Chakra.Accordion
  ( IntOrArrayOfInt(..)
  , AccordionProps
  , AccordionItemProps
  , accordion
  , accordionIcon
  , accordionItem
  , accordionPanel
  , accordionHeader
  ) where

import Chakra.Internal (WithChildren)
import Effect.Uncurried (EffectFn1)
import Prelude (Unit, (<<<))
import Prim.Row (class Union)
import React.Basic.Hooks (JSX, ReactComponent, element)

data IntOrArrayOfInt
  = Int
  | Array Int

-- | Props for the accordion component
type AccordionProps
  = WithChildren
      ( allowMultiple :: Boolean
      , allowToggle :: Boolean
      , index :: IntOrArrayOfInt
      , defaultIndex :: IntOrArrayOfInt
      , onChange :: EffectFn1 IntOrArrayOfInt Unit
      , children :: JSX
      )

-- | Props for individual accordion items
type AccordionItemProps
  = WithChildren
      ( isOpen :: Boolean
      , defaultIsOpen :: Boolean
      , id :: String
      , isDisabled :: Boolean
      , onChange :: EffectFn1 IntOrArrayOfInt Unit
      , children :: JSX
      )

-- | https://chakra-ui.com/accordion
accordion :: forall p r. Union p r AccordionProps => { | p } -> JSX
accordion = element accordionImpl

accordionItem :: forall p r. Union p r AccordionItemProps => { | p } -> JSX
accordionItem = element accordionItemImpl

accordionHeader :: JSX -> JSX
accordionHeader = element accordionHeaderImpl <<< { children: _ }

accordionPanel :: JSX -> JSX
accordionPanel = element accordionPanelImpl <<< { children: _ }

accordionIcon :: JSX -> JSX
accordionIcon = element accordionIconImpl <<< { children: _ }

-- FFI stuff
foreign import accordionImpl :: forall p r. Union p r AccordionProps => ReactComponent { | p }

foreign import accordionItemImpl :: forall p r. Union p r AccordionItemProps => ReactComponent { | p }

foreign import accordionHeaderImpl :: ReactComponent { | WithChildren () }

foreign import accordionIconImpl :: ReactComponent { | WithChildren () }

foreign import accordionPanelImpl :: ReactComponent { | WithChildren () }
