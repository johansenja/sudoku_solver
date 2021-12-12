# Sudoku solver

An OOP sudoku solver written purely in Ruby, with no dependencies. Tested on two different puzzles (very easy and
moderate)

## Run the tests

`rspec`

## Using this as a library

It's possible, you can `require` it where needed, and then call `Sudoku::Solver.solve(grid)`, where
grid is a 2 dimensional array of numbers, with `nil` for empty squares, eg.

```ruby
require "./lib/sudoku_solver"

Sudoku::Solver.solve [
  [  4,nil,  6,     5,nil,  2,     8,nil,  9],
  [nil,nil,nil,   nil,  4,nil,   nil,  3,nil],
  [nil,nil,nil,   nil,nil,nil,   nil,nil,  5],

  [  6,nil,nil,     8,nil,nil,     1,nil,nil],
  [  5,nil,nil,   nil,  7,nil,   nil,  8,nil],
  [  3,nil,  2,     9,nil,  4,   nil,  6,nil],

  [nil,  2,nil,      6,nil,nil,     3,nil,  1],
  [nil,nil,nil,   nil,   5,nil,   nil,nil,nil],
  [  8,  3,nil,   nil,   9,nil,   nil,nil,  2],
]
```
