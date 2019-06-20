module StateErrorMonad where

import Control.Monad(ap)

data StateError msg dfn s a  =  StateError (dfn -> s -> (Either msg (s,a)))

runStateError (StateError sa) = sa

instance Functor (StateError msg dfn s) where
  -- map the function f to the result of the Parser
  fmap f (StateError sa) =  StateError (\ dfn s -> case sa dfn s of 
    Left msg -> Left msg 
    Right (s , a) -> (s, f a))


--ignore this for now
instance Applicative (StateError msg dfn s) where
  pure = return
  (<*>) = ap


instance Monad (StateError msg dfn s) where
  return a =  StateError (\ dfn s -> Right (s,a))

  (StateError sa) >>= f = StateError (\ dfn s -> csae sa dfn s of Left msg -> Left msg 
  Right (s,a) -> runSateError (f a) dfn s)
	
local :: StateError msg dfn s a -> s -> StateError msg dfn s a
local se new = undefined

getDfns :: StateError msg dfn s dfn
getDfns = undefined

-- many more possibilities...
  
  
