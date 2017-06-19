//
//  ViewController.swift
//  NonNullDictionaryDemo
//
//  Created by Rati on 16/06/17.
//  Copyright © 2017 Ratti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dic : Dictionary<String,Any> = Dictionary()
    var arrDictionary : Array<Dictionary<String,Any>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nullValue : NSNull = NSNull.init()
        
        dic["a"] = nullValue
        dic["b"] = "b"
        dic["c"] = "c"
        dic["d"] = nullValue
        
        for i in 0 ... 5
        {
            arrDictionary.append(dic)
        }
        
        dic["d"] = arrDictionary
        print("\(dic)")
        
        let dicNonNull : Dictionary<String,Any> = NonNullDictionary.removeNull(json: dic)
        let arrNonNullDic : Array<Dictionary<String,Any>> = NonNullDictionary.removeNull(arr: arrDictionary)
        
        print("\(dicNonNull)")  //Dictionary without null
        print("\(arrNonNullDic)") // Array of dictionary without null
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

