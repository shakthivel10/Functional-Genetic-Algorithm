module GA where
import System.Random

type FitnessValue = Int

type Evaluated c = (FitnessValue, c)

type Population c = [Evaluated c]

type Seed = Int

type Count = Integer

type Size = Integer 

