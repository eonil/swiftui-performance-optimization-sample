import SwiftUI

struct HPAssetView: View {
    var bridge: HPBridge
    var body: some View {
        HPAssetContentView(bridge: bridge)
    }
}

struct HPAssetContentView: View {
    var bridge: HPBridge
    var body: some View {
        VStack {
            Text("Currencies: \(bridge.data.market.currencyTable.count)")
            Text("P-Swaps: \(bridge.data.market.pswapTable.count)")
            Text("Wallets: \(bridge.data.user.walletTable.count)")
            Text("Positions: \(bridge.data.user.positionTable.count)")
            
            ScrollView {
                ForEach(0..<100) { i in
                    Text(i.description)
                }
            }
        }
    }
}

#Preview {
    HPAssetContentView(bridge: HPBridge())
}