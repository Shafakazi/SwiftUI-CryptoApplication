//
//  UIApplication.swift
//  SwiftFulCrypto
//
//  Created by Shafakhat on 28/01/26.
//

import Foundation
import SwiftUI

extension UIApplication{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
