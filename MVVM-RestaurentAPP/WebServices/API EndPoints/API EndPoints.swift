//
//  API EndPoints.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation

//Http Services
enum HttpService {
    case baseUrl
    var BaseUrl:String{
        switch self {
        case .baseUrl:
            return "http://sandbox.bottlerocketapps.com/BR_iOS_CodingExam_2015_Server/"
        }
    }
}

//End Points
enum APIendPoint {
    case restaurentData
    var endPoint:String{
        switch self {
        case .restaurentData:
            return "restaurants.json"
        }
    }
}
