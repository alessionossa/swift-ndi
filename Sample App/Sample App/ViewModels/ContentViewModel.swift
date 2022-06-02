//
//  ContentViewModel.swift
//  swift-ndi Sample
//
//  Created by Alessio Nossa on 02/06/22.
//

import CoreImage
import swift_ndi
import Combine

class ContentViewModel: ObservableObject {
    
  private let ndiWrapper: swift_ndi?
    
  private var sampleBuffCancellable: AnyCancellable?

  init() {
    self.ndiWrapper = swift_ndi()
      
    ndiWrapper?.start("Sample NDI")
  }
}
