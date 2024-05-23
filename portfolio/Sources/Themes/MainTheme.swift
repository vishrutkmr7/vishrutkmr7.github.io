import SwiftUI
import Ignite

struct MainTheme: Theme {
    func render(page: Page, context: PublishingContext) async -> HTML {
        HTML {
            Head {
                Title(page.title + (context.site.titleSuffix.isEmpty ? "" : context.site.titleSuffix))
                Link(rel: .stylesheet, href: URL(string: "/style.css")!)
            }
            Body {
                NavigationBar(logo: context.site.name) {
                    Link("About Me", target: Home())
                    Link("Projects", target: Home())  // Change target to actual project pages if you create them
                    Link("Contact", target: Home())   // Change target to actual contact page if you create one
                }
                .background(.black)
                .navigationBarStyle(.dark)
                .position(.fixedTop)
                
                Div {
                    page.body
                }
                .padding(.top, 80) // Add padding to avoid content being hidden under the navigation bar
            }
        }
    }
}


struct ThemeContent<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
}
