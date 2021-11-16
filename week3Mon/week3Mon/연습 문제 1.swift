//
//  연습 문제 1.swift
//  week3Mon
//
//  Created by 성주 on 2021/11/15.
//

import Foundation

class Matrix {
    var a : Double
    var b : Double
    var c : Double
    var d : Double
    
    init(a : Double = 0.0, b : Double = 0.0, c : Double = 0.0, d : Double = 0.0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    func sum(with other: Matrix) -> Matrix{
        return Matrix(a: a + other.a, b: b + other.b, c: c + other.c, d: d + other.d)
    }
    func product(with other: Matrix) -> Matrix{
        return Matrix(a: a*other.a + b*other.b, b: a*other.b + b*other.d, c: c*other.a + d*other.c, d: c*other.b + d*other.d)
    }
    func printMatrix(){
        print([a, b])
        print([c, d])
        print("")
    }
}
var firstMatrix = Matrix(a: 4, b: 4, c: 4, d: 4)
var secondMatrix = Matrix(a: 6, b: 6, c: 6, d: 6)
