//
//  TextFieldWithCustomPrompt.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 02/10/2022.
//

import SwiftUI

struct PlaceholderModifier<Placeholder>: ViewModifier where Placeholder : View {
	let isShowing: Bool
	@ViewBuilder let placeholder: () -> Placeholder
	
	func body(content: Content) -> some View {
		ZStack(alignment: .leading) {
			placeholder()
				.opacity(isShowing ? 1 : 0) // retains placeholder size even when it's hidden
			content
		}
	}
}

extension View {
	func placeholder<Placeholder>(isShowing: Bool,
								  @ViewBuilder placeholder: @escaping () -> Placeholder) -> some View
	where Placeholder : View {
		modifier(PlaceholderModifier(isShowing: isShowing, placeholder: placeholder))
	}
}

struct TextFieldWithCustomPrompt<Prompt>: View where Prompt : View {
	@Binding var text: String
	@Binding var shouldShowPlaceholder: Bool
	var didBeginEditing: (() -> Void)? = nil
	var didEndEditing: (() -> Void)? = nil
	var didCommit: (() -> Void)? = nil
	var onTextChange: ((String) -> Void)? = nil
	@ViewBuilder let prompt: () -> Prompt
	
	
	var body: some View {
		TextField("", text: $text, onEditingChanged: { didBegin in
			if didBegin {
				didBeginEditing?()
			} else {
				didEndEditing?()
			}
		}, onCommit:{
			didCommit?()
		})
		.onChange(of: text, perform: { newValue in
			onTextChange?(newValue)
		})
		.placeholder(isShowing: shouldShowPlaceholder, placeholder: prompt)
	}
}
