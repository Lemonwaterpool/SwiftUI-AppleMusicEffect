//
//  MainView.swift
//  SwiftUI-AppleMusicEffect
//
//  Created by H Chan on 2020/06/25.
//

import SwiftUI

struct MainView: View {
    
    @State var languages: [Language] = [
        Language(id: 0, lang: "English"),
        Language(id: 1, lang: "Spanish"),
        Language(id: 2, lang: "German"),
        Language(id: 3, lang: "Japanese"),
        Language(id: 4, lang: "Chinese"),
        Language(id: 5, lang: "Korean"),
        Language(id: 6, lang: "Spanish"),
    ]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    
    @State var seleted: [Language] = []
    
    @Namespace var nameSpace
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 15) {
                    
                    ForEach(self.languages) { language in
                        Text(language.lang)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: language.id, in: nameSpace)
                            .onTapGesture {
                                self.seleted.append(language)
                                self.languages.removeAll {
                                    $0.lang == language.lang
                                }
                            }
                    }
                }
                .padding(.all)
                
                HStack {
                    Text("Selected Language")
                        .font(.title)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    
                    ForEach(self.seleted) { language in
                        Text(language.lang)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 100)
                            .background(Color.green)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: language.id, in: nameSpace)
                            .onTapGesture {
                                self.languages.append(language)
                                self.seleted.removeAll {
                                    $0.lang == language.lang
                                }                            }
                    }
                }
                .padding(.all)
                
            }
            .navigationTitle("Choose Language")
            .navigationBarTitleDisplayMode(.inline)
        }
        .animation(.spring())
    }
}

// MARK : - Model


struct Language: Identifiable {
    var id: Int
    var lang: String
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
