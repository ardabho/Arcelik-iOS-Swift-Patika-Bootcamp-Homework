//
//  ViewController.swift
//  Week2
//
//  Created by Arda Büyükhatipoğlu on 25.05.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var receivedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension FirstViewController: MyDataSendingDelegateProtocol {
    
    /// Sets the text sent from second view controller to the labels text
    /// - Parameter myData: A string
    func sendDataToFirstViewController(myData: String) {
        if myData != "" {
            self.receivedDataLabel.text = myData
        } else {
            self.receivedDataLabel.text = "No Data Sent"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondVC"{
            let destinationVC: SecondViewController = segue.destination as! SecondViewController
            destinationVC.delegate = self //set delegate as self
            destinationVC.dataSentFromFirstVC = "Ninja Turtles" //send data to second view controller
        }
    }
    
}

