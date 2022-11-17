//
//  PDFViewController.swift
//  Labor
//
//  Created by mehrnoush abdinian on 08.09.22.
//

import UIKit
import WebKit
import Toast

class PDFViewController: UIViewController {
    
    var coordinator: PDFCoordinator?
    let webView = WKWebView()
    var pdfName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
        loadPdf()
        layout()
    }
    
    func configVC() {
        view.backgroundColor = .white
        title = pdfName
        webView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func loadPdf() {
        if let pdfUrl = Bundle.main.url(forResource: pdfName, withExtension: "pdf", subdirectory: nil, localization: nil) {
            do {
                let data = try Data(contentsOf: pdfUrl)
                webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfUrl.deletingLastPathComponent())
                print("pdf file loading...")
            }
            catch {
                print("failed to open pdf")
                let toast = Toast.default(
                    image: UIImage(named: "error")!,
                    title: "Register",
                    subtitle: "Failed to open pdf"
                )
                toast.show()
            }
            return
        }
        print("pdf file doesn't exist")
        let toast = Toast.default(
            image: UIImage(named: "error")!,
            title: "Register",
            subtitle: "PDF file doesn't exist"
        )
        toast.show()
    }
    
    private func layout() {
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: webView.topAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: webView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: webView.trailingAnchor),
            view.leadingAnchor.constraint(equalTo: webView.leadingAnchor),
        ])
    }
}
