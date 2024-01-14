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

// let's make use of the DummyProtocol we just created.
// let's make`DummyViewOne` generic, where it would conform to DummyProtocol.
struct DummyViewOne<T: DummyProtocol>: View {
  // I need to change the type of viewModel to be T, cause the compiler is throwing an error on line 12, saying `type of T can't be inferred.`
  @ObservedObject var viewModel: T
  // builds and runs successfully, let's commit.
  
  var body: some View {
    VStack {
      TextField("First name", text: $viewModel.firstName)
        .textFieldStyle(.roundedBorder)
      Text(viewModel.firstName)
      
      TextField("Message", text: $viewModel.message)
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.never)
      Text(viewModel.message)
      
      // calling DummyViewTwo, and passing viewModel to it.
      DummyViewTwo(viewModel: viewModel)
    }
    .padding(.horizontal, 8)
  }
}

// next, let's add a second View, where it would be generic of type out protocol as well. and call it inside ViewOne.
struct DummyViewTwo<S: DummyProtocol>: View {
  @ObservedObject var viewModel: S
  
  var body: some View {
    Text(viewModel.firstName + " " + viewModel.message)
  }
}
// builds and runs successfully!

#Preview {
  ContentView()
}
