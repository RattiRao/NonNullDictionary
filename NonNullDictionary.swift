//
//  NonNullDictionary.swift
//  Vafroo
//
//  Created by Rati on 05/06/17.
//  Copyright © 2017 flexsin. All rights reserved.
//

import UIKit

class NonNullDictionary: NSObject {
    
    static func removeNull(arr : Array<Dictionary<String,Any>>) -> Array<Dictionary<String,Any>>
    {

        var arrJson : Array<Dictionary<String,Any>> = arr
        var i : Int = 0
        
        for dic in arrJson
        {
            var newDic : Dictionary<String,Any> = dic
            i = i+1
            
            for (key,value) in newDic
            {
                
                if value is NSNull
                {
                    let strKey : String = String.init(format: "%@", key)
                    newDic[strKey] = ""
                }
                
                else if value is Array<Dictionary<String,Any>>
                {
                    let arrNonNull : Array<Dictionary<String,Any>> = removeNull(arr: value as! Array<Dictionary<String, Any>>)
                    let strKey : String = String.init(format: "%@", key)
                    
                    newDic[strKey] = arrNonNull
                }
            }
            
            arrJson[i-1] = newDic
        }
        
        return arrJson
    }
    
   static func removeNull(json : Dictionary<String,Any>) -> Dictionary<String,Any>
    {
        var newDic : Dictionary<String,Any> = json
        
        for (key,value) in newDic
        {
            if value is NSNull
            {
                let strKey : String = String.init(format: "%@", key)
                newDic[strKey] = ""
            }
        }
        
        return newDic
    }
}
