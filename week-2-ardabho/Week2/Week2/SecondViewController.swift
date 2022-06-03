//
//  SecondViewController.swift
//  Week2
//
//  Created by Arda Büyükhatipoğlu on 25.05.2022.
//

import UIKit

//Protocol to send data to First View Controller
protocol MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(myData: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataToSendBackTextField: UITextField!
    
    var delegate: MyDataSendingDelegateProtocol? //MyDataSendingDelegateProtocol delegate
    var dataSentFromFirstVC: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataSentFromFirstVC)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendDataButtonClicked(_ sender: UIButton) {
        //if delegate is not nil and textfield is not nil, activate delegates sendDataToFirstViewController method and send data back to first vc
        if delegate != nil && dataToSendBackTextField.text != nil {
            let dataToBeSent = dataToSendBackTextField.text
            delegate?.sendDataToFirstViewController(myData: dataToBeSent!)
            dismiss(animated: true)
        }
    }
    

}
