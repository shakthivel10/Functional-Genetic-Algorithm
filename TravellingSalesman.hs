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

tspFitness :: TSPChromosome -> FitnessValue
tspFitness c =   ( tspFitnessHelper c ) + (euclidianDistance (head c) (head (reverse c))) -- adding distance between first and last nodes

tspFitnessHelper :: TSPChromosome -> FitnessValue
tspFitnessHelper [] = 0
tspFitnessHelper (x:[]) = 0
tspFitnessHelper (x:xs) = (euclidianDistance x (head xs)) + tspFitnessHelper (xs)

euclidianDistance :: Coordinate -> Coordinate -> Int 
euclidianDistance  (x1,y1) (x2,y2) =  floor (sqrt (fromIntegral ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))))

tspCrossOver :: Seed -> TSPChromosome -> TSPChromosome -> TSPChromosome
tspCrossOver s parent1 parent2 = nub (mixChromosomes s parent1 parent2)

mixChromosomes :: Seed -> TSPChromosome -> TSPChromosome -> TSPChromosome
mixChromosomes s [] [] = [] 
mixChromosomes s [] p2 = p2 
mixChromosomes s p1 [] = p1 
mixChromosomes s p1 p2 | even (randomNumberLessthanN s 1000) = (head p1) : mixChromosomes (randomNumberLessthanN s 99) (tail p1) p2
                        | otherwise = (head p2) : mixChromosomes (randomNumberLessthanN s 199) p1 (tail p2)

