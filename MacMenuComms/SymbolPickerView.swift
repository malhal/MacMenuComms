//
// Sample project to accompany article at
// https://troz.net/post/2025/mac_menu_data/
//
// by Sarah Reichelt
// https://linktr.ee/trozware
//

import SwiftUI

struct SymbolPickerView: View {
  @Binding var symbol: Symbol

  var body: some View {
    HStack(alignment: .top) {
      VStack(spacing: 20) {
        Picker("Symbol", selection: $symbol.name) {
          ForEach(Symbol.names, id: \.self) { name in
            Text(name)
          }
        }

        Picker("Color", selection: $symbol.color) {
          ForEach(Symbol.colors, id: \.self) { color in
            Text(color.description)
              .foregroundColor(color)
          }
        }

        Text(
          "You have selected \(symbol.name) in \(symbol.color.description)."
        )
      }
      .pickerStyle(.segmented)

      Button {
        symbol.chooseRandomSymbolAndColor()
      } label: {
        VStack {
          Image(systemName: "dice")
            .font(.title)
          Text("Random")
        }
        .padding()
      }
    }
  }
}

#Preview {
  @Previewable @State var symbol: Symbol = Symbol()
  SymbolPickerView(symbol: $symbol)
}
