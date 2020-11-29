module GA where
import System.Random

type FitnessValue = Int

type Evaluated c = (FitnessValue, c)

type Population c = [Evaluated c]

type Seed = Int

type Count = Integer

type Size = Integer 

getChromosome :: Evaluated c -> c
getChromosome (f, c) = c

getFitness :: Evaluated c -> FitnessValue
getFitness (f, c) = f

compareChromosomes :: Evaluated c -> Evaluated c -> Evaluated c
compareChromosomes (f1, c1) (f2, c2) | f1 <= f2 =  (f1, c1)
                                     | otherwise = (f2, c2)

getChromosomeWithMinFitness :: Population a ->  Evaluated a
getChromosomeWithMinFitness [] = error "Error, Empty Population."
getChromosomeWithMinFitness p = head (filter ((==) minVal . fst) p) where minVal = minimum (map fst p)

