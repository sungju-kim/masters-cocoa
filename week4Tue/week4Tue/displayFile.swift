//
//  displayFile.swift
//  week4Tue
//
//  Created by 성주 on 2021/11/23.
//

import Foundation

struct DisplayFiles {
    func displayAllFiles(at path: String) -> [String] {
        let fileManager = FileManager.default
        
        return try! fileManager.contentsOfDirectory(atPath: path)
    }
    
    func printResult(){
        let arr = displayAllFiles(at: "/System/Library/Desktop Pictures")
        arr.forEach{
            if $0 == arr.first {print("┌ \($0)")}else if $0 == arr.last {print("└ \($0)")}else{print("├ \($0)")}}}}

let displayFiles = DisplayFiles()

