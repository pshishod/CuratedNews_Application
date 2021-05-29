//
//  Variables&Defs.swift
//  BeesNews
//
//  Created by Priyansh Shishodia on 5/29/21.
//
//Holds all the global variables and their initializations. Also holds Classes that can be used globally

import Foundation

/*----- Variables -----*/

let user_key = "BlackList"  //Key used in Userdefault to get the array of blacklisted publishers

var news_object: NewNews?   //Main object that stores all the data from API calls

var obj: Value = Value()    //Default value after ??

/*----- Classes and Definitions -----*/

class update: ObservableObject{     //Used for updating the view once the API call has been made
    @Published var obj_loaded: Bool = false
    init(){
    }
    
}


class refresh: ObservableObject{    //used for updating the view in general
    @Published var refreshing:Bool = false
    init(){
    }
}
