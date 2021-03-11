//
//  weather.swift
//  yasmine_claire
//
//  Created by Rasiya on 1/3/21.
//  Copyright © 2021 ite. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController{
 
    var titleDataArray = [String]()
    var subtitleDataArray = [String]()

    struct Weather: Codable {
        let weather: [weatherType]
        struct weatherType: Codable{
            let main: String?
            let description: String?
            let icon: String?

        }
        let main: mainType
        struct mainType: Codable{
            let temp: Float?
            let humidity: Int?
        }

        let clouds: cloudsType
        struct cloudsType: Codable{
            let all: Int?
        }

        let sys: sysType
        struct sysType: Codable{
            let country: String?
        }

        let name: String?
    }



        @IBOutlet weak var lblWeatherTitle: UILabel!

        @IBOutlet weak var lblWeatherTemp: UILabel!

        @IBOutlet weak var imgBackground: UIImageView!


    @IBAction func btnNext(_ sender: UIButton) {
        let alert = UIAlertController(title: "Success", message: "Your Order will be delivered by today!.", preferredStyle: .alert)
               let ok = UIAlertAction(title: "Ok", style: .default)
               alert.addAction(ok)
               present(alert, animated: true, completion: nil)
    }
    
    //671da9a974d1cd1548bda7a9c7ad06e8

        override func viewDidLoad() {
            super.viewDidLoad()
            
           
            guard let url = URL(string:
           "https://api.openweathermap.org/data/2.5/weather?q=Singapore,SG&appid=671da9a974d1cd1548bda7a9c7ad06e8")
           else {
                return
            }

            let task = URLSession.shared.dataTask(with: url) {
             (data, response, error) in
             guard let dataResponse = data,
             error == nil else {
             print(error?.localizedDescription ?? "Response Error")
             return
             }
                do{
                 let decoder = JSONDecoder()
                 let model = try decoder.decode(Weather.self, from: dataResponse)

                     print(model)


                    DispatchQueue.main.async {

                        self.lblWeatherTitle.text =  model.name!

                        self.lblWeatherTemp.text = model.weather[0].main! + "\n\n" + model.weather[0].description! + "\n\n" + String(model.main.temp!) + "ºC"

                        if model.weather[0].description!.contains("rain") {
                            self.imgBackground.image = UIImage(named: "rain.jpg")

                        }
                        else{
                            self.imgBackground.image = UIImage(named: "sun.jpg")
                        }


                     }

                 }catch let parsingError {
                 print("Error", parsingError)
                 }

             }
             task.resume()
        }


    }


