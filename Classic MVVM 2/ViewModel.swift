//
//  ViewModel.swift
//  Classic MVVM 2
//
//  Created by EquipeSuporteAplicacao on 8/6/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    var updatedList : (() -> ())?

    var data : [Something] = []{
        didSet{
            self.updatedList!()
        }
    }
    
    private func fetchData(){
        var somethingArray : [Something] = []
        
        for index in 0..<5{
            let something = Something(title: "Something title \(index)", subtitle: "Something subtitle \(index)")
            somethingArray.append(something)
        }
        
        self.data = somethingArray
    }
    
    func numberOfRows() -> Int{
        let row = self.data.count
        
        if row == 0{
            self.fetchData()
        }
        
        return row
    }
    
    func x(index : Int) -> Something{
        return self.data[index]
    }
}
