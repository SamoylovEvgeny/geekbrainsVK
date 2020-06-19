//
//  ViewController.swift
//  L1_Samoylov_Evgeny
//
//  Created by Evgen on 24.03.2020.
//  Copyright © 2020 XXX. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!{
        didSet{
            webView.navigationDelegate = self
        }
    }

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7465221"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
                webView.load(request)

        NotificationCenter.default.addObserver(
           self,
           selector: #selector(keyboardWasShown(notification:)),
           name: UIResponder.keyboardWillShowNotification,
           object: nil)
        NotificationCenter.default.addObserver(
           self,
           selector: #selector(keyboardWillBeHidden(notification:)),
           name: UIResponder.keyboardWillHideNotification,
           object: nil)
   }
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        switch identifier {
//        case "loginCorrect":
//            let isAuth = login()
//            if !isAuth {
//                showErrorAlert()
//            }
//            return isAuth
//        default:
//            return true
//        }
//    }
//    func login() -> Bool {
//        let login = loginInput.text!
//        let password = passwordInput.text!
//        return login == "admin" && password == "123456"
//        }
//    func showErrorAlert() {
//        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя",preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        scrollBottomConstraint.constant = frame.height
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
    }
}


extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        let session = Session.instance
        session.token = token!
        print(session.token)
        performSegue(withIdentifier: "loginCorrect", sender: nil)
        decisionHandler(.cancel)
        
    }
}
