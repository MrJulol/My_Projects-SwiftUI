import Foundation

func removeSmallInts(list: [Int], lim: Int) -> [Int] {
    return list.filter({ (element:Int)-> Bool in 
        element >= lim
    })
}
func containsDuplicate(list: [Int]) -> Bool {
    var dic:[Int:Int] = [:]
    for item:Int in list{
        dic[item] = (dic[item] ?? 0 ) + 1
    }
    for item:Int in dic.values{
        if item > 1{
            return true
        }
    }
    return false
}
func inEither(list1: [Int], list2: [Int]) -> [Int] {
    var either:[Int] = []
    for element:Int in list1{
        if list2.contains(element){
            either.append(element)
        }
    }
    return either
}


let numbers:[Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let numbers2:[Int] = [1, 2, 5,11,20, 2,10]
