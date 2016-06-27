//
//  File.swift
//  WeatherChecker
//
//  Created by Peter Regard on 6/5/16.
//  Copyright © 2016 Peter Regard. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBookUI



class second: UIViewController {
    
    
    
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        
        self.feelsLabel.isHidden = true
        self.Feels.isHidden = true
        
        self.tempLabel?.isHidden = true
        self.DegreeSym.isHidden = true
        
        self.precipLabel?.isHidden = true
        self.precip.isHidden = true
        
        self.Humid.isHidden = true
        self.humidLabel.isHidden = true
        
        self.waitingDial.isHidden = false
        
        self.noLocation.isHidden = true
        
        self.sunnyIcon.isHidden = true
        self.clearNightIcon.isHidden = true
        self.rainyIcon.isHidden = true
        self.snowyIcon.isHidden = true
        self.windyIcon.isHidden = true
        self.foggyIcon.isHidden = true
        self.cloudyIcon.isHidden = true
        self.partlyCloudyIcon.isHidden = true
        self.cloudyNightIcon.isHidden = true
        
        
        
        geocoding("\(address)")
        {
            //        Weather
            //        __________________________________________________________________
            
            
            print("this is the new Lat \(self.newLat)")
            self.forecastUrl = URL(string: "https://api.forecast.io/forecast/956caa21f4ca41ecf05999993bbfcbe1/\(self.newLat),\(self.newLong)")
            print(self.forecastUrl!)
            self.getForecast(){(currently) in
                if let currentWeather = currently
                {
                    // Update UI
                    DispatchQueue.main.async
                    {
                        self.DWNLoadJson()
                        
                        
                        // Use NSURL Session Api to fetch Data
                        
                        
                        let configuration = URLSessionConfiguration.default()
                        let session = URLSession(configuration: configuration)
                        
                        // NSURL Request Object
                        
                        let request = URLRequest(url: self.forecastUrl!)
                        let dataTask = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: NSError?) -> Void in
                            //                            print(data!)
                        })
                        dataTask.resume()
                        
                        
                    }
                    self.waitingDial.isHidden = true
                    
                    self.tempLabel?.text = "\(currentWeather.temperature!)"
                    self.tempLabel?.isHidden = false
                    
                    self.precipLabel?.text = "\(currentWeather.precipWhole!)%"
                    self.precipLabel?.isHidden = false
                    
                    self.humidLabel?.text = "\(currentWeather.humidWhole!)%"
                    self.humidLabel.isHidden = false
                    
                    self.feelsLabel?.text = "\(currentWeather.feelsLike!)º"
                    self.feelsLabel.isHidden = false
                    
                    self.precip.isHidden = false
                    self.Humid.isHidden = false
                    self.Feels.isHidden = false
                    self.DegreeSym.isHidden = false
                    
                    switch (currentWeather.icon)
                    {
                    case "clear-day"? :
                        self.sunnyIcon.isHidden = false
                        
                    case "clear-night"? :
                        self.clearNightIcon.isHidden = false
                        
                    case "rain"? :
                        self.rainyIcon.isHidden = false
                        
                    case "snow"?:
                        self.snowyIcon.isHidden = false
                        
                    case "wind"? :
                        self.windyIcon.isHidden = false
                        
                    case "fog"? :
                        self.foggyIcon.isHidden = false
                        
                    case "cloudy"? :
                        self.cloudyIcon.isHidden = false
                        
                    case "partly-cloudy-day"? :
                        self.partlyCloudyIcon.isHidden = false
                        
                    case "partly-cloudy-night"? :
                        self.cloudyNightIcon.isHidden = false
                        
                    default:
                        self.sunnyIcon.isHidden = false
                        
                        
                    }

                }
                
            }
            
        }

    }
    
    
    
    
    
   
    @IBOutlet weak var clearNightIcon: UIImageView!
    @IBOutlet weak var cloudyIcon: UIImageView!
    @IBOutlet weak var cloudyNightIcon: UIImageView!
    @IBOutlet weak var foggyIcon: UIImageView!
    @IBOutlet weak var partlyCloudyIcon: UIImageView!
    @IBOutlet weak var rainyIcon: UIImageView!
    @IBOutlet weak var snowyIcon: UIImageView!
    @IBOutlet weak var windyIcon: UIImageView!
    @IBOutlet weak var sunnyIcon: UIImageView!
    @IBOutlet weak var DegreeSym: UILabel!
    
    
    @IBOutlet weak var Feels: UILabel!
    @IBOutlet weak var Humid: UILabel!
    @IBOutlet weak var tempLabel: UILabel?
    @IBOutlet weak var precip: UILabel!
    
    @IBOutlet weak var waitingDial: UIActivityIndicatorView!
    
    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel?
    
    var firstViewController: ViewController?

    @IBOutlet weak var noLocation: UILabel!
    
    var newLat:Double = 0.0
    var newLong:Double = 0.0
    var forecastUrl = URL(string:"")
    var address = "40507"
    var coordinates = (0.0 , 0.0)
    
    
    
    
    
    override func viewDidLoad()
    {
                
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //        Geocoding
        //        __________________________________________________________________
        
//        print("At load time: \(coordinates)")
        geocoding("\(address)")
        {
            //        Weather
            //        __________________________________________________________________
            
            
//            print("this is the new Lat \(self.newLat)")
            self.forecastUrl = URL(string: "https://api.forecast.io/forecast/956caa21f4ca41ecf05999993bbfcbe1/\(self.newLat),\(self.newLong)")
//            print(self.forecastUrl!)
            self.getForecast(){(currently) in
                if let currentWeather = currently
                {
                    // Update UI
                    DispatchQueue.main.async
                    {
                        self.DWNLoadJson()
                        
                        
                        // Use NSURL Session Api to fetch Data
                        
                        
                        let configuration = URLSessionConfiguration.default()
                        let session = URLSession(configuration: configuration)
                        
                        // NSURL Request Object
                        
                        let request = URLRequest(url: self.forecastUrl!)
                        let dataTask = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: NSError?) -> Void in
//                            print(data!)
                        })
                        dataTask.resume()
                        
                        
                    }
                        self.waitingDial.isHidden = true
                    
                        self.tempLabel?.text = "\(currentWeather.temperature!)"
                        self.DegreeSym.textColor = UIColor.white()
                        self.tempLabel?.textColor = UIColor.white()
                    
                        self.precipLabel?.text = "\(currentWeather.precipWhole!)%"
                        self.precipLabel?.textColor = UIColor.white()
                    
                        self.humidLabel?.text = "\(currentWeather.humidWhole!)%"
                        self.humidLabel.textColor = UIColor.white()
                    
                        self.feelsLabel?.text = "\(currentWeather.feelsLike!)º"
                        self.feelsLabel.textColor = UIColor.white()
                    
                        self.precip.textColor = UIColor.white()
                        self.Humid.textColor = UIColor.white()
                        self.Feels.textColor = UIColor.white()
                    
                    
                    
                        switch (currentWeather.icon)
                        {
                        case "clear-day"? :
                            self.sunnyIcon.isHidden = false
                            
                        case "clear-night"? :
                            self.clearNightIcon.isHidden = false
                            
                        case "rain"? :
                            self.rainyIcon.isHidden = false
                            
                        case "snow"?:
                            self.snowyIcon.isHidden = false
                            
                        case "wind"? :
                            self.windyIcon.isHidden = false
                            
                        case "fog"? :
                            self.foggyIcon.isHidden = false
                            
                        case "cloudy"? :
                            self.cloudyIcon.isHidden = false
                            
                        case "partly-cloudy-day"? :
                            self.partlyCloudyIcon.isHidden = false
                            
                        case "partly-cloudy-night"? :
                            self.cloudyNightIcon.isHidden = false
     
                        default:
                            self.sunnyIcon.isHidden = false
                            
                            
                        }
                }
                
            }
            
        }
        
        
    }
    
    
    
    // func GetForecast
    func getForecast(_ completion: ((CurrentWeather?) -> Void))
    {
//        print(self.forecastUrl)
        let networkOperation = NetworkOperation(url: (self.forecastUrl)!)
        networkOperation.downloadJSONFromUrl
            { (JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
        }
        
    }
    
    
    func geocoding(_ location: String, completion: () -> ())
    {
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if placemarks?.count > 0
            {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                self.coordinates = (coordinate!.latitude, coordinate!.longitude)
                self.newLat = (coordinate!.latitude)
                self.newLong = (coordinate!.longitude)
                print("Inside completion handler: \(self.coordinates)")
                completion()
            }
            else
            {
//                print("Sorry, I am not able to find that location.")
                self.waitingDial.isHidden = true
                self.noLocation.isHidden = false
                
            }
        }
        print("Outside completion handler: \(self.coordinates)")
    }
    
    func currentWeatherFromJSON(_ jsonDictionary: [String: AnyObject]?) -> CurrentWeather?
    {
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject]
        {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        }
        else
        {
            print("JSON Dictionary returned nil for 'currently' key")
            return nil
        }
    }
    
    
    func DWNLoadJson ()
    {
        let requestURL: URL = URL(string: "https://api.forecast.io/forecast/956caa21f4ca41ecf05999993bbfcbe1/\(self.newLat),\(self.newLong)")!
//        var request = URLRequest(url:requestURL!)
        let request = URLRequest(url:requestURL)
//        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL)
        let session = URLSession.shared()
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200)
            {
                print("Everyone is fine, Weather downloaded successfully.")
                do
                {
                    
                    let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject]
                    
                    print(jsonDictionary)
                }
                catch {print(error)}

            }
            
        }
        
        task.resume()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}


