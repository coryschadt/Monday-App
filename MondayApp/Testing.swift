//
//  Testing.swift
//  MondayApp
//
//  Created by Cory Schadt on 2021-10-06.
//

import SwiftUI
import WebKit

struct Testing: View {
    @State var text = "<html><body><h1>Hello World</h1></body></html>"
     
    var body: some View {
      WebView(text: $text)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
  }
  struct WebView: UIViewRepresentable {
    @Binding var text: String
     
    func makeUIView(context: Context) -> WKWebView {
      return WKWebView()
    }
     
    func updateUIView(_ uiView: WKWebView, context: Context) {
      uiView.loadHTMLString(text, baseURL: nil)
    }
  }
struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}

