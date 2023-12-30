//
//  Observable.swift
//  tableview_MVVM
//
//  Created by Samir Raut on 22/12/23.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ Value: T? = nil) {
        self.value = Value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ Listener: @escaping ((T?) -> Void)) {
        
        Listener(value)
        self.listener = Listener
        
    }
    
}
