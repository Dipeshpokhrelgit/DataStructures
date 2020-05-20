//
//  ViewController.swift
//  DataStructurePractice
//
//  Created by Dipesh Pokhrel on 5/1/20.
//  Copyright © 2020 Dipesh Pokhrel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         var Node0 = Vertex()
        Node0.key = "0"
         var Node1 = Vertex()
        Node1.key = "1"
         var Node2 = Vertex()
          Node2.key = "2"
         var Node3 = Vertex()
          Node3.key = "3"
         var Node4 = Vertex()
          Node4.key = "4"
         var Node5 = Vertex()
         Node5.key = "5"
         var Node6 = Vertex()
          Node6.key = "6"
         var Node7 = Vertex()
         Node7.key = "7"
         var Node8 = Vertex()
         Node8.key = "8"
        
        var edge01 = Edge()
            edge01.destinationVertex = Node1
        var edge02 = Edge()
            edge01.destinationVertex = Node2
   //     var edge14 = Edge()
     //       edge14.destinationVertex = Node4
        var edge13 = Edge()
            edge13.destinationVertex = Node3
        var edge25 = Edge()
           edge25.destinationVertex = Node5
       // var edge24 = Edge()
         //   edge24.destinationVertex = Node4
        var edge36 = Edge()
           edge36.destinationVertex = Node6
        
       // var edge47 = Edge()
         //   edge47.destinationVertex = Node7
        var edge46 = Edge()
            edge46.destinationVertex = Node6
        var edge57 = Edge()
            edge57.destinationVertex = Node7
        var edge68 = Edge()
            edge68.destinationVertex = Node8
     //   var edge78 = Edge()
          //  edge78.destinationVertex = Node8
        
        Node0.neighbours = [edge01,edge02]
        Node1.neighbours = [edge13]
        Node2.neighbours = [edge25]
        Node3.neighbours = [edge36]
        Node4.neighbours = [edge46]
        Node5.neighbours = [edge57]
        Node6.neighbours = [edge68]
      //  Node7.neighbours = [edge78]

     //   DFS(starting: Node0)
        KnapsackProblem()
        // Do any additional setup after loading the view.
    }
    
    func KnapsackProblem() -> Int { //
        
        var weights = [0,2,3,4,5]
        var profits : [Int] = [0,1,2,5,6]
        var maximumWeight  = 8
        var matrix : [[Int]] = Array(repeating: Array(repeating: 0, count: maximumWeight + 1 ), count: weights.count)
        
        for i in 0..<weights.count  {
            for j in 0..<maximumWeight {
                //when there is no weight selected and number elements are zero
                if i == 0 || j == 0 {
                    matrix [i][j] = 0
                }else if weights[i] < maximumWeight {
                    //profit of current weith
                   let currentProfit = profits[i]
                    //Remaining weight
                    let remainingWeight = (i - j) > 0 ? i - j : 0
                    var maximumProfitOnRemainingWeight = profits[remainingWeight]
                    var totalProfit = currentProfit + maximumProfitOnRemainingWeight
                    //Previous MaximumProfit
                    if totalProfit > matrix[i-1][j] {
                        matrix[i][j] = totalProfit
                    }else {
                         matrix[i][j] = matrix[i-1][j]
                    }
                }else { // if provided weight is more than current wwieht capacity
                    matrix[i][j] = matrix[i-1][j]
                    
                }
                
            }
        }
        
        for obj in matrix {
            print(obj)
        }
        
        
        
        return 0
        
        
        
    }
    
    func DFS(starting : Vertex) {
         var isVisited : [Vertex] = []
        
        func getValidToExplore(validVertex : Vertex) -> Vertex? {
            for i in 0..<validVertex.neighbours.count {
                let vertex = validVertex.neighbours[i]
                if vertex.destinationVertex != nil {
                if !isVisited.contains(vertex.destinationVertex!)  {
                   // print("Valid \(vertex.destinationVertex?.key)")
                        return vertex.destinationVertex
                    }
                    
                }
            }
            return nil
        }
        
        var starting =  starting // I hope someday swift will chnge this
        var stack = Stack()
        print(starting.key)
        isVisited.append(starting)
        stack.push(element: starting)
       
        while !stack.isEmpty() {
            //     print("Staring \(starting.key)")
            if  let x = getValidToExplore(validVertex: starting) {
                print(x.key)
                isVisited.append(x)
                stack.push(element: x)
                starting = x
            }else {
                stack.pop()
                if let poped = stack.top() {
                    //   print("hello \(poped.key)")
                    starting = poped
                }
            }
            
        }
        for o in isVisited {
         //   print("Visited \(o.key)")
        }
    }

    
}

//Graph classes
class Vertex : Equatable {
    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return (lhs.key == rhs.key && rhs.neighbours == rhs.neighbours) ? true : false
    }
    var key : String?
    var neighbours : [Edge] = []
}

class Edge : Equatable {
    static func == (lhs: Edge, rhs: Edge) -> Bool {
         return (lhs.destinationVertex == rhs.destinationVertex && rhs.weight == rhs.weight) ? true : false
    }
    var destinationVertex : Vertex?
    var weight : Int?
}
class Stack  {
    var temporaryArray : [Vertex] = []
    func push(element : Vertex) {
        temporaryArray.append(element)
    }
    func pop() {
       // print("REMoved \(temporaryArray.first?.key)")
        temporaryArray.removeLast()
    
        for x in temporaryArray {
         //   print("After removing \(x.key)")
        }
    }
    func top()-> Vertex? {
        return temporaryArray.last
    }
    func isEmpty() -> Bool {
       // print("temporaryCount \(temporaryArray.count)")
        if temporaryArray.count == 0 {
            return true
        }
        return false
    }
}
