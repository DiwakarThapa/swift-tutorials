// Swift Merge Sort Solution - Swift 3 //

import Foundation

let array = [1, 2, 0, 12, 9 ,28, 7]

func mergeSort(_ array:[Int]) -> [Int] {
    
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ left:[Int], _ right:[Int]) -> [Int] {
    
    var sortedArray:[Int] = []
    
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        var leftValue = left[leftIndex]
        var rightValue = right[rightIndex]
        
        if leftValue < rightValue {
            sortedArray.append(leftValue)
            leftIndex += 1
        } else if leftValue > rightValue {
            sortedArray.append(rightValue)
            rightIndex += 1
        } else {
            sortedArray.append(leftValue)
            leftValue += 1
            sortedArray.append(rightValue)
            rightValue += 1
        }
    }
    
    while leftIndex < left.count {
        sortedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        sortedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return sortedArray
}

let merged = mergeSort(array)
