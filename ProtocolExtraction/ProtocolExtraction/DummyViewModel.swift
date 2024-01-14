//
//  DummyViewModel.swift
//  ProtocolExtraction
//
//  Created by Mohamad Rahmani on 15.01.24.
//

import Foundation

final class DummyViewModel: ObservableObject {
  @Published var firstName: String = ""
  @Published var message: String = ""
}
