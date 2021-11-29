//
//  VideoYoutube.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 28-11-21.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }
    
    
    
}
