//
//  RestaurentViewModel.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation
class RestaturentViewModel{
   
    // var getdata:observable<string?> = observable(nil)
    var getdata:observable<[Restaurant]> = observable([])
    func callAPI(){
        if NetworkMonitor.shared.isConnected{
            let url = HttpService.baseUrl.BaseUrl+APIendPoint.restaurentData.endPoint
            APIManager.shared.callAPI(url:url, method: "get", body: nil, result: RestaurentList.self) { result in
                switch result{
                case .success(let code):
                    self.getdata.value = code.restaurants
                    print(self.getdata.value)
                case .failure(let fail):
                    if fail is APIError{
                        print("Error is \(String(describing: fail.APIErrorDescriptions))")
                    }
                }
            }
        }else{
            print("Network Error")
        }
    }
}



