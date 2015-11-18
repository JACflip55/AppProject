//
//  DataModel.swift
//  Buzzed
//
//  Created by Alan Guerrero on 10/21/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataModel{
    //    var deals = [NSManagedObject]()
    var deals:[Deals] = [Deals]()
    var establishments:[Bars] = [Bars]()
    
    func getCount()-> Int{
        return establishments.count
    }
    
    func getDealCount()-> Int{
        return deals.count
    }
    func getDealCountBarID(barID:Int)-> Int{
        var count = 0
        for d in deals{
            if(barID == d.barID){
                count++
            }
        }
        return count
    }
    
    init(){
        establishments.append(Bars(name: "Shakespeare", image: UIImage(named:"shakespear.jpg")!, lat: 30.267388, long: -97.739778, barID: 1))
        
        establishments.append(Bars(name: "The Blind Pig", image: UIImage(named:"blindpig.jpg")!, lat: 30.266938, long: -97.739870, barID: 2))
        establishments.append(Bars(name: "Barbarella", image: UIImage(named:"barbarella.jpg")!, lat: 30.267126, long: -97.736584, barID: 3))
        
        deals.append(Deals(name: "Vodka", price: 2, barID: 1))
        deals.append(Deals(name: "Tequila", price: 4, barID: 2))
        deals.append(Deals(name: "Beer", price: 1, barID: 2))
        deals.append(Deals(name: "Pitcher", price: 5, barID: 3))
        deals.append(Deals(name: "Margarita", price: 3.50, barID: 3))
    }
    
    func getBar(index:Int)->Bars{
        if(index<establishments.count){
            return establishments[index]
        }
        else
        {
            return Bars(name: "no Bar", image:UIImage(named: "")!, lat:0.0, long:0.0, barID:0)
        }
    }
    
    func getBarFromName(name:String)->Bars{
        var index = 0
        while(index<establishments.count){
            if(establishments[index].name == name){
                return establishments[index]
            }
            index++
        }
        return Bars(name: "no Bar", image:UIImage(named: "")!, lat:0.0, long:0.0, barID:0)
    }
    
    func addDeal(name:String, price:Float, barID:Int){
        deals.append(Deals(name: name, price: price, barID: barID))
    }
    
    func getDeal(index:Int)->Deals{
        if(index<deals.count){
            return deals[index]
        }
        else
        {
            return Deals(name: "no Deal", price:0, barID:0)
        }
    }
    func getDealFromName(name:String)->Deals{
        var index = 0
        while(index<deals.count){
            if(deals[index].name == name){
                return deals[index]
            }
            index++
        }
        return Deals(name: "no Deal", price:0, barID:0)
    }
    
    func getDealBarID(index:Int, barID:Int)->Deals{
        if(index<deals.count && deals[index].barID == barID){
            return deals[index]
        }
        else
        {
            return Deals(name: "no Deal", price:0, barID:0)
        }
    }
    func getNextDealBarID(barDealCount:Int, barID:Int)->Deals{
        var numDeal = 0
        for d in deals{
            if(barID == d.barID && numDeal == barDealCount){
                return d
            }
            else if(barID == d.barID){
                numDeal++
            }
        }
        return Deals(name: "no Deal", price:0, barID:0)
    }
}