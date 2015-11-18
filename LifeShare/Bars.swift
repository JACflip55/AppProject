//
//  Bars.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import UIKit

class Bars{
    
    private var _name:String = ""
    private var _image:UIImage
    private var _long:Double = 0.0
    private var _lat:Double = 0.0
    private var _barID:Int = 0
    
    var name:String{
        get{
            return _name
        }
        set(newValue){
            _name = newValue
        }
    }
    var image:UIImage{
        get{
            return _image
        }
        set(newValue){
            _image = newValue
        }
    }
    var lat:Double{
        get{
            return _lat
        }
        set(newValue){
            _lat = newValue
        }
    }
    var long:Double{
        get{
            return _long
        }
        set(newValue){
            _long = newValue
        }
    }
    var barID:Int{
        get{
            return _barID
        }
        set(newValue){
            _barID = newValue
        }
    }
    init(name:String, image:UIImage, lat:Double, long:Double, barID:Int){
        _name = name
        _image = image
        _lat = lat
        _long = long
        _barID = barID
    }
}
