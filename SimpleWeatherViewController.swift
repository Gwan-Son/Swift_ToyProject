//
//  SimpleWeatherViewController.swift
//  SimpleWeather
//
//  Created by 심관혁 on 2/24/24.
//

import UIKit

class SimpleWeatherViewController: UIViewController {

    let cities = ["Seoul","Tokyo","LA","Seattle"]
    
    let weathers = ["cloud.fill","cloud.sun.fill","sun.max.fill","wind","cloud.bolt.fill"]
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(_ sender: Any) {
        changeCity()
    }
    
    func changeCity() {
        label.text = cities.randomElement()
        image.image = UIImage(systemName: weathers.randomElement()!)?.withRenderingMode(.alwaysOriginal)
        let temp = Int.random(in: 0..<30)
        tempLabel.text = "\(temp)°"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
