//
//  TranslateViewController.swift
//  Bbetter_app
//
//  Created by 강재혁 on 2022/04/17.
//

import UIKit

class TranslateViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet var searchText: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchText.delegate = self
        self.searchText.refreshControl?.addTarget(self, action: #selector(textViewDidChange(_:)), for: .editingChanged)
        self.textLabel.numberOfLines = 0
       
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func textViewDidChange(_ textView: UITextView) {
        callURL()
    }
    func callURL(){
        let text = searchText.text!
        let param = "source=ko&target=en&text=\(text)"
        let paramData = param.data(using: .utf8)
        let Naver_URL = URL(string: "https://openapi.naver.com/v1/papago/n2mt")
          
        let ClientID = "Hh2mfTWbBwsDiGUc9wC4"
        let ClientSecret = "VqZyDhr4Lz"
        
        var request = URLRequest(url:Naver_URL!)
        request.httpMethod = "POST"
        request.addValue(ClientID,forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(ClientSecret,forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = paramData
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        //Session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        //Task
        let task = session.dataTask(with: request) { (data, response, error) in
            //통신 성공
            if let data = data {
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                print(str)
                
                DispatchQueue.main.async {
                    self.textLabel.text = str
                }
                
            }
            //통신 실패
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
        
        
        
        
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
