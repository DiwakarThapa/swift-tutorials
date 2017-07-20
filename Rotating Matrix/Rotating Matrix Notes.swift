// Rotating Matrix Notes
// Hello folks. I'm going to walk you through this algorithm to rotate a matrix in swift
// A fantastic resource is this article: https://stackoverflow.com/questions/42519/how-do-you-rotate-a-two-dimensional-array
// It is in Python, but it's very clear

//  [ 0, 1, 2, 3, 4],
//  [ 5, 6, 6, 8, 9],
//  [10,11,12,13,14],
//  [15,16,17,18,19],
//  [20,21,22,23,24]

// Our goal is that we can rotate any 2d array of any size (equal lengths on both sides: 2x2, 3x3 etc) by 90 degrees clockwise
// This seems to be a somewhat common whiteboard question at interviews

// Import old faithful Foundation
import Foundation

// Here is our matrix
var matrix = [
    [ 0, 1, 2, 3, 4],
    [ 5, 6, 6, 8, 9],
    [10,11,12,13,14],
    [15,16,17,18,19],
    [20,21,22,23,24]
]

// Let's declare our rotate function
// Notice how it is non-mutating as it returns another array - functional programming yay!

func rotateDatMatrix(_ matrix:[[Int]]) -> [[Int]] {
   
}

rotateDatMatrix(matrix)
