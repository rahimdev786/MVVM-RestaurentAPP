//
//  API Error.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation



enum APIError:Error {
case ErrorInUrl
case ResponceIncorrect
case ResponceCode(Int)
case SeesionOut
case ErrorInData
case ErrorInEncodeData
    
}


extension APIError:LocalizedError
{
    public var APIErrorDescriptions: String?
      {
        switch self {
        case .ErrorInUrl:
              return "Error In Http Requuest"
        case .ResponceIncorrect:
             return "Responce Error in Comming request"
        case .ResponceCode(let code):
            return "Responce Http Status Code \(code)"
        case .SeesionOut:
            return " Seesion Out In Responce"
        case .ErrorInData:
            return "Error IN Data Accurs"
        case .ErrorInEncodeData:
            return "Error In Encode Data"
        }
    }
}
