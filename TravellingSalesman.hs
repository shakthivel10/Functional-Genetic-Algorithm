import GA
import Data.List
import System.Random

type Coordinate = (Int, Int)

type TSPChromosome = [Coordinate]

tspMakePop :: Seed -> Size -> TSPChromosome -> Population TSPChromosome
tspMakePop s size c = let listOfChromosomes = tspMakeListOfChromosomes s size c in [((tspFitness c),c) | c <- listOfChromosomes]

tspMakeListOfChromosomes :: Seed -> Size -> TSPChromosome -> [TSPChromosome]
tspMakeListOfChromosomes s size l = let perms = perm l in [perms!!i | i <- [(randomNumberLessthanN s (length perms))| s <- (take (fromInteger size) [1..])] ]

perm :: [a] -> [[a]]
perm []      = [[]]
perm [a]     = [[a]]
perm (x:xs)  = insertBetweenListOfLists x (perm xs) 

insertBetweenListOfLists :: a -> [[a]] -> [[a]]
insertBetweenListOfLists a []     = []
insertBetweenListOfLists a (x:xs) = (insertBetweenListHelper a [] x) ++ (insertBetweenListOfLists a xs)

insertBetweenListHelper ::  a -> [a] -> [a] -> [[a]]
insertBetweenListHelper a [] []         = [[a]]
insertBetweenListHelper a [] (x:xs)     = (a:(x:xs)) : (insertBetweenListHelper a [x] xs)
insertBetweenListHelper a (x:xs) (y:ys) = ((x:xs) ++ [a] ++ (y:ys)) : (insertBetweenListHelper a ((x:xs) ++ [y]) ys)
insertBetweenListHelper a (x:xs) []     =  [((x:xs) ++ [a])]


