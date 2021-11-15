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
        let matrix = Matrix()
        matrix.a = a + other.a
        matrix.b = b + other.b
        matrix.c = c + other.c
        matrix.d = d + other.d
        return matrix
    }
    func product(with other: Matrix) -> Matrix{
        let matrix = Matrix()
        matrix.a = a*other.a + b*other.b
        matrix.b = a*other.b + b*other.d
        matrix.c = c*other.a + d*other.c
        matrix.d = c*other.b + d*other.d
        return matrix
    }
    func printMatrix(){
        print([a, b])
        print([c, d])
        print("")
    }
}
var firstMatrix = Matrix(a: 4, b: 4, c: 4, d: 4)
var secondMatrix = Matrix(a: 6, b: 6, c: 6, d: 6)
