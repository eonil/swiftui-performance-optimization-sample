import SwiftUI

/// A lazily rendered list view.
/// - Fixed cell height.
/// - Item view content is derived from source item element.
/// - Source item element is `Hashable`. This view does not redraw items for same source element.
///   - Provide different key to redraw view.
///
struct HPLazyListView<Source, ItemView: View>: View where Source: RandomAccessCollection, Source.Index == Int, Source.Element: Hashable {
    init(data: Source, cellHeight: CGFloat, itemContent: @escaping (Source.Element) -> ItemView) {
        spec = Spec(data: data, cellHeight: cellHeight, itemContent: itemContent)
    }
    
    var spec: Spec
    struct Spec {
        var data: Source
        var cellHeight: CGFloat
        var itemContent: (Source.Element) -> ItemView
    }
    
    var body: some View {
        if #available(iOS 17, *) {
            Since_iOS17(spec: spec)
        }
        else {
            Pre_iOS17(spec: spec)
        }
    }
}
