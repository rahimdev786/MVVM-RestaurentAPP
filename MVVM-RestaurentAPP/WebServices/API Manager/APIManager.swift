//
//  APIManager.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation

public class APIManager{
    static let shared:APIManager = APIManager()
    private init(){}
    
    var dataTask:URLSessionTask?
    
    func callAPI <T:Codable>(url:String,method:String,body:Data?, result: T.Type ,completion:@escaping (Result<T,APIError>) -> Void )  {
          
        DispatchQueue.global().async {
            guard let url = URL(string: url) else { return }
            var httpRequest = URLRequest(url: url)
            httpRequest.httpMethod = method
            httpRequest.setValue("application/json", forHTTPHeaderField: "Content - type")
            httpRequest.timeoutInterval = 600
            httpRequest.httpBody = body
            
          URLSession.shared.dataTask(with: httpRequest) { data, responce, err in
              
              if err != nil{
                  completion(.failure(.ErrorInUrl))
                  return
              }
              
              guard let responce = responce as? HTTPURLResponse else {
                  completion(.failure(.ErrorInData))
                  return
              }
              
          
              guard (200...299).contains(responce.statusCode) else{
                  completion(.failure(.ResponceCode(responce.statusCode)))
                  return
              }
              
              guard let data = data else {
                  completion(.failure(.ErrorInData))
                  return
              }
              
              do{
                  let result = try JSONDecoder().decode(T.self, from: data)
                  completion(.success(result))
              }catch{
                  completion(.failure(.ErrorInEncodeData))
              }
          }.resume()
        }
    }
    
}
