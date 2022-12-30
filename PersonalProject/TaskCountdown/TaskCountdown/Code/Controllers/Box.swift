//
//  Box.swift
//  TaskCountdown
//
//  Created by 우주형 on 2022/12/30.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    
    //MARK: - variables
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    var listener: Listener?
    
    
    //MARK: - inits
    
    init(_ value: T) {
        self.value = value
    }
    
    //MARK: - functions
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func removeBinding() {
        self.listener = nil
    }
}
