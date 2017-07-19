// Rotating Matrix Algorithm imlementation
// Article coming to Medium shortly

import Foundation

var matrix: [[Int]] = [
    [ 0, 1, 2, 3, 4],
    [ 5, 6, 6, 8, 9],
    [10,11,12,13,14],
    [15,16,17,18,19],
    [20,21,22,23,24]
]

func rotate(_ matrix:[[Int]]) {
    var tempMatrix = matrix
    let matrixLength = matrix.count
    let rotatbleLayers = matrixLength / 2
    
    // For 0 in 0...2
    for var layer in 0...rotatbleLayers {
        let first = layer // 0
        let last = matrixLength - first - 1 // 1 (Array indexes yay)
        
        // For 0 in 0...4
        // For 1 in 0...4
        for var element in first...last {
            
            // Offset is 0 - 0
            // Offset is 0 - 1 => -1
            let offset = first - element
            
            let right_side = matrix[element][last] // 4 // 9
            let bottom = matrix[last][last+offset] // 24 // 23
            let left_side = matrix[last+offset][first] // 20 // 15
            let top = matrix[first][element] // 0 // 1
            
            tempMatrix[first][element] = left_side
            tempMatrix[element][last] = top
            tempMatrix[last][last+offset] = right_side
            tempMatrix[last+offset][first] = bottom
        }
    }
}

rotate(matrix)
