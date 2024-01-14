//
//  ContentView.swift
//  ProtocolExtraction
//
//  Created by Mohamad Rahmani on 15.01.24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    DummyViewOne(viewModel: DummyViewModel())
      .padding()
  }
}

struct DummyViewOne: View {
  @ObservedObject var viewModel: DummyViewModel
  
  var body: some View {
    VStack {
      TextField("First name", text: $viewModel.firstName)
        .textFieldStyle(.roundedBorder)
      Text(viewModel.firstName)
      
      TextField("Message", text: $viewModel.message)
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.never)
      Text(viewModel.message)
    }
    .padding(.horizontal, 8)
  }
}

#Preview {
  ContentView()
}
