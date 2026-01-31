//
//  XMarkButton.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 30/01/26.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
           presentationMode.wrappedValue.dismiss()
       }, label: {
           Image(systemName: "xmark")
               .font(.headline)
       })

    }
}

#Preview {
    XMarkButton()
}
