import SwiftUI

struct IconTextField: View {
    var icon: String = "envelope"
    @Binding var value: String
    var label: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    
    // Show password
    @State private var isSecureTextEntry = true
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            if isSecure {
                if isSecureTextEntry {
                    SecureField(label, text: $value)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                        .textInputAutocapitalization(.never)
                } else {
                    TextField(label, text: $value)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                        .textInputAutocapitalization(.never)
                        .keyboardType(keyboardType)
                }
                
                Button(action: {
                    isSecureTextEntry.toggle()
                }) {
                    Image(systemName: isSecureTextEntry ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
            } else {
                TextField(label, text: $value)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.trailing, 20)
                    .textInputAutocapitalization(.never)
                    .keyboardType(keyboardType)
            }
        }
        .padding(.horizontal)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color(.systemGray6)))
        .background(Color(.systemGray6))
        .contentMargins(12)
    }
}

#Preview {
    IconTextField(value: .constant(""), label: "Email")
}
