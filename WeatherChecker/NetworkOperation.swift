//
//  NetworkOperation.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/8/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import Foundation


class NetworkOperation
{
    lazy var config: URLSessionConfiguration = URLSessionConfiguration.default()
    lazy var session: URLSession = URLSession(configuration: self.config)
    let queryURL: URL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: URL)
    {
        self.queryURL = url
        
    }
    
    
    
    
    func downloadJSONFromUrl(_ completion: JSONDictionaryCompletion)
    {
        
        let request: URLRequest = URLRequest(url: queryURL)
        
        let dataTask = session.dataTask(with: request)
        { (data, response, error) in
            
            //1. Check HTTP Response for sucsessful GET request
            
            if let httpResponse = response as? HTTPURLResponse
            {
                if httpResponse.statusCode == 200
                {
                    //2. Create JSON object with Data
                    do
                    {
                        let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject]
                        completion(jsonDictionary)
                    }
                    catch{print(error)}
                }
                else
                {
                    print("GET request not sucsessful. HTTP status code\(httpResponse.statusCode)")
                }
                
                
            }
                
                
            else
            {
                print("error, not a valid HTTP response")
            }
            
            
            
            
        }
        
        dataTask.resume()
        
    }
    
}






