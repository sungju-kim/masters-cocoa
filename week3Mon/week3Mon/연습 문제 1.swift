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
    
    init() {
        a = 0
        b = 0
        c = 0
        d = 0
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
        print([a, b, c, d])
    }
}

class FirstMatrix : Matrix {
    override init() {
        super.init()
            a = 4
            b = 4
            c = 4
            d = 4
        
    }
}

class SecondMatrix : Matrix {
    override init() {
        super.init()
        a = 6
        b = 6
        c = 6
        d = 6
    }
}

var firstMatrix = FirstMatrix()
var secondMatrix = SecondMatrix()
