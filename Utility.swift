//
//  Utility.swift
//  MovieTest
//
//  Created by Miguel Angel Requena on 27-11-21.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.hidesWhenStopped = true
        uiView.startAnimating()
    }
    
}
