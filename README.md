# Genetic-Algorithm-Haskell

Genetic Algorithms provide a method of creating approximate solutions to a wide class of intractable problems. This is an implementation of a Genetic Algorithm in Haskell, a the Functional Language, used to solve the Travelling Salesman Problem and the Bin Packing Problem.

  

**Bin-packing problem**

The following variant of the bin-packing problem is considered.

Given b bins and w weights, that can each weigh a different amount. The objective is to assign all the weights to bins, to give as equal a distribution as possible. This can be gauged by summing the weight held in each bin, and examining the difference between the heaviest bin and the lightest bin. The smaller this difference, the better.

A chromosome for the Bin-packing problem is represented by a list of integers. Each integer in the list represents which bin the weight belongs to. Hence each element in the list is a Integer in the range [0, b).

The fitness function for this problem is calculated by summing the weight held in each bin, and examining the difference between the heaviest bin and the lightest bin.

A crossover is performed by choosing a random number between [0, w) and concatenating the part on the left side of this integer on the first parent and the right side of this integer on the second parent, to generate a new offspring.

The binPackingSolver takes in the following arguments: number of bins, list of weights, a seed to generate random numbers, ‘count’ which represents the number of evolutions to be simulated and ‘size’ which represents the size of the population.

Below are some sample outputs.

binPackGASolve 3 [1,2,3,4,5] 4 20 20
(0,[2,1,1,2,0]) -- Optimal

binPackGASolve 4 [1,2,3,5,4,5] 1 40 40
(5,[2,2,0,3,1,0])

binPackGASolve 4 [1,2,3,5,4,5] 1 100 100
(0,[2,0,0,1,2,3]) -- Optimal

binPackGASolve 5 [1,2,3,5,6,4,5] 1 50 100
(9,[1,1,2,1,0,3,3])

binPackGASolve 5 [1,2,3,5,6,4,5] 3 50 100
(1,[2,0,0,4,3,2,1]) -- Optimal

binPackGASolve 5 [1,2,3,5,6,4,5,1,3] 7 600 200
(10,[3,1,0,4,4,1,2,1,1])

binPackGASolve 5 [1,2,3,5,6,4,5,1,3] 7 800 800
(7,[3,0,4,0,1,4,2,3,1])

binPackGASolve 5 [1,2,3,5,6,4,5,1,3] 7 800 1000
(0,[2,1,4,0,3,1,2,0,4]) -- Optimal