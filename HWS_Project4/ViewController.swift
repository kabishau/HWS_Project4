import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://apple.com")!
        let request = URLRequest(url: url)
        webView.load(request)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
    }
    
    @objc func openTapped() {
        
        let alertController = UIAlertController(title: "Open Website:", message: nil, preferredStyle: .actionSheet)
        let appleAction = UIAlertAction(title: "apple.com", style: .default, handler: openPage)
        let hwsAction = UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(appleAction)
        alertController.addAction(hwsAction)
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(alertController, animated: true, completion: nil)
        
    }
    
    func openPage(alertAction: UIAlertAction) {
        let title = alertAction.title!
        let url = URL(string: "https://" + title)!
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

