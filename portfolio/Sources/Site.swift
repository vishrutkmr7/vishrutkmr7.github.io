import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = VishrutPortfolio()
        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct VishrutPortfolio: Site {
        // Required associated types
    typealias HomePageType = Home
    typealias TagPageType = EmptyTagPage
    typealias ThemeType = MainTheme
    typealias MarkdownRendererType = MarkdownToHTML
    typealias RobotsType = DefaultRobotsConfiguration
    
        // Required properties
    var author: String = "Vishrut Jha"
    var titleSuffix: String = " - Portfolio"
    var name: String = "Vishrut Jha"
    var description: String? = "Full-Stack Developer Portfolio"
    var language: Language = .english
    var url: URL = URL(string: "https://vishrutkmr7.github.io")!
    var pageWidth: Int = 10
    var builtInIconsEnabled: Bool = true
    var syntaxHighlighters: [SyntaxHighlighter] = []
    var markdownRenderer: MarkdownToHTML.Type = MarkdownToHTML.self
    var feedConfiguration: FeedConfiguration = .default
    var robotsConfiguration: DefaultRobotsConfiguration = DefaultRobotsConfiguration()
    var homePage: HomePageType = Home()
    var tagPage: TagPageType = EmptyTagPage()
    var theme: ThemeType = MainTheme()
    var favicon: URL? = nil
    
    @StaticPageBuilder var pages: [any StaticPage] {
            // Define your static pages here
    }
    
    @ContentPageBuilder var layouts: [any ContentPage] {
            // Define your content layouts here
    }
}
