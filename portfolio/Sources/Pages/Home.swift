import SwiftUI
import Ignite

struct Home: Page {
    var title: String {
        "Home"
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                    // About Me Section
                Section(header: Text("About Me").font(.title).padding()) {
                    Text("""
                    Hi, I'm Vishrut Jha, a full-stack developer specializing in iOS development using SwiftUI. I have a passion for creating high-quality, user-friendly applications and have worked on numerous projects across various domains.
                    """)
                    .padding()
                }
                .padding()
                
                    // My Links to Socials
                Section(header: Text("My Links to Socials").font(.title).padding()) {
                    VStack(alignment: .leading) {
                        Link("GitHub", destination: URL(string: "https://github.com/vishrutkmr7")!)
                        Link("LinkedIn", destination: URL(string: "https://linkedin.com/in/vishrutkmr7")!)
                    }
                    .padding()
                }
                .padding()
                
                    // My Career Section
                Section(header: Text("My Career").font(.title).padding()) {
                    Text("""
                    I am currently a Software Engineer - iOS at PNYX, where I lead the development of the iOS app using SwiftUI and AVFoundation for high-quality music playback. I have also worked at Dhan AI and Compliance Group, contributing to various backend and frontend projects.
                    """)
                    .padding()
                }
                .padding()
                
                    // My Projects Section
                Section(header: Text("My Projects").font(.title).padding()) {
                    VStack(alignment: .leading) {
                        Link("FIFA WC Buddy", destination: URL(string: "https://github.com/vishrutkmr7/FIFAWC2022")!)
                    }
                    .padding()
                }
                .padding()
                
                    // Achievements Section
                Section(header: Text("Achievements").font(.title).padding()) {
                    Text("""
                    - Led the development of the PNYX iOS app using SwiftUI and AVFoundation
                    - Integrated AI music recommendations using Harmix.AI
                    - Migrated OAuth from SAP Gigya to Firebase Auth for Dhan AI
                    """)
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Vishrut Jha Portfolio")
        }
    }
}
