import Data.List
import Data.Function

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- Import a module:
--   import Data.List
--
-- Import only some functions from module:
--   import Data.List (nub, sort)
--
-- Import module, hide functions:
--   import Data.List hiding (nub)
--
-- Import qualified:
--   import qualified Data.Map
--
-- Import qualified, aliased
--   import qualified Data.Map as M
--

ret1 = find (>4) [1,2,3,4,5,6]
ret2 = 4 `elemIndex` [1,2,3,4,5,6]
ret3 = [1..10] \\ [2,5,9]
ret4 = [1,2,3] `union` [4,5,6]

ret5 = groupBy ((==) `on` (> 0)) [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]
