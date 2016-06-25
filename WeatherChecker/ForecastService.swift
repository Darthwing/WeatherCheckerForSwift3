//
//  ForecastService.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/8/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import Foundation



struct forecastService
{
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey:String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string:"https://api.forecast.io/forecast/\(forecastAPIKey)/" )
        
    }
    
    
}



