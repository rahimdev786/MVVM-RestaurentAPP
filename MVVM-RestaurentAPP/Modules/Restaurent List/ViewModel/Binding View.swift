//
//  Binding View.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation

class observable<T> {
    var value:T{
        didSet{
            listiner?(value)
        }
    }
    var listiner:((T)->(Void))?
    
    init(_ value:T){
        self.value = value
    }
    
    func bind(_ closure:@escaping(T) -> Void){
        closure(value)
        listiner = closure
    }
}
