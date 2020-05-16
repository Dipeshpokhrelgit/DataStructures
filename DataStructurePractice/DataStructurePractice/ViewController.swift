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
         var Node1 = Vertex()
         var Node2 = Vertex()
         var Node3 = Vertex()
         var Node4 = Vertex()
         var Node5 = Vertex()
         var Node6 = Vertex()
         var Node7 = Vertex()
         var Node8 = Vertex()
        
        var edge01 = Edge()
        var edge02 = Edge()
        
        var edge14 = Edge()
        var edge13 = Edge()
        
        var edge25 = Edge()
        var edge24 = Edge()
        
        var edge36 = Edge()
        
        
        var edge47 = Edge()
        var edge46 = Edge()
        
        var edge57 = Edge()
        
        var edge68 = Edge()
        var edge78 = Edge()
        
        
        Node0.neighbours = [edge01,edge02]
        Node1.neighbours = [edge14,edge13]
        Node2.neighbours = [edge24,edge25]
        Node3.neighbours = [edge36]
        Node4.neighbours = [edge47,edge46]
        Node5.neighbours = [edge57]
        Node6.neighbours = [edge68]
        Node7.neighbours = [edge78]

        // Do any additional setup after loading the view.
    }
    func DFS(starting : Vertex) {
        
        var starting =  starting // I hope someday swift will chnge this
        var stack = Stack()
        print(starting.key)
        stack.push(element: starting)
        var isVisited : [Vertex] = []
        while !stack.isEmpty() {
            var p = stack.top()
            for i in 0..<(p?.neighbours.count)!  {
                if !isVisited.contains( (p?.neighbours[i].destinationVertex)!) {
                    print((p?.neighbours[i].destinationVertex?.key)!)
                    stack.push(element: (p?.neighbours[i].destinationVertex!)!)
                    break
                }
            }
            
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
        temporaryArray.removeFirst()
    }
    func top()-> Vertex? {
       return temporaryArray.first
    }
    func isEmpty() -> Bool {
        if temporaryArray.count == 0 {
            return true
        }
        return false
    }
}
