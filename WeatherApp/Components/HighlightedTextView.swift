//
//  HighlightedTextView.swift
//  WeatherApp
//
//  Created by Juan Esteban Pelaez on 6/01/25.
//

import SwiftUI

struct HighlightedTextView: View {
    
    let text: String
    let boldText: String

    var body: some View {
        let attributedString = self.attributedBold(text: self.text, boldText: self.boldText)
        Text(attributedString)
    }
    
    func attributedBold(text: String, boldText: String, font: Font = .title) -> AttributedString {
        var result = AttributedString(text)
        result.font = font
        if let range = result.range(of: boldText, options: .caseInsensitive) {
            result[range].font = font.bold()
        }
        return result
    }
    
}

#Preview {
    HighlightedTextView(text: "This text is bold", boldText: "BOld")
}
