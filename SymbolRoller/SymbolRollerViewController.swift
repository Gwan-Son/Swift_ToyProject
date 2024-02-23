//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by 심관혁 on 2/24/24.
//

import UIKit

class SymbolRollerViewController: UIViewController {

    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: - 심볼에서 하나를 임의로 추출한 뒤, 이미지와 텍스트에 설정
        symbolChage()
    }
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        symbolChage()
    }
    
    func symbolChage(){
        let symbol = symbols.randomElement()!
        
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
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
