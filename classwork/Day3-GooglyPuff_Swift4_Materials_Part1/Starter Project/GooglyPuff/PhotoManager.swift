/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

struct PhotoManagerNotification {
  // Notification when new photo instances are added
  static let contentAdded = Notification.Name("com.raywenderlich.GooglyPuff.PhotoManagerContentAdded")
  // Notification when content updates (i.e. Download finishes)
  static let contentUpdated = Notification.Name("com.raywenderlich.GooglyPuff.PhotoManagerContentUpdated")
}

struct PhotoURLString {
  // Photo Credit: Devin Begley, http://www.devinbegley.com/
  static let overlyAttachedGirlfriend = "https://i.imgur.com/YQqblz3.jpg"
  static let successKid = "data:image/jpeg;base64,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"
  static let lotsOfFaces = "https://www.sbs.com.au/guide/sites/sbs.com.au.guide/files/styles/full/public/cast_1.jpg?itok=gyGNXYak"
}

typealias PhotoProcessingProgressClosure = (_ completionPercentage: CGFloat) -> Void
typealias BatchPhotoDownloadingCompletionClosure = (_ error: NSError?) -> Void

final class PhotoManager {
  private init() {}
  static let shared = PhotoManager()
  
  private let concurrentPhotoQueue = DispatchQueue(label: "com.raywenderlich.GooglyPuff.photoQueue",
                                                   attributes: .concurrent)
  private var unsafePhotos: [Photo] = []
  
  var photos: [Photo] {
//    return unsafePhotos
    var photosCopy: [Photo]!
    // 1
    concurrentPhotoQueue.sync { //Dispatch synchronously onto the concurrentPhotoQueue to perform the read
      // 2
      photosCopy = self.unsafePhotos
    }
    return photosCopy
  }
  
  func addPhoto(_ photo: Photo) {
//    unsafePhotos.append(photo)
//    DispatchQueue.main.async { [weak self] in
//      self?.postContentAddedNotification()
//    }
    concurrentPhotoQueue.async(flags: .barrier) { [weak self] in //You dispatch the write operation asynchronously with a barrier. When it executes, it will be the only item in your queue.
      // 1
      guard let self = self else {
        return
      }
      // 2
      self.unsafePhotos.append(photo)
      // 3
      DispatchQueue.main.async { [weak self] in
        self?.postContentAddedNotification()
      }
    }
  }
  
  func downloadPhotos(withCompletion completion: BatchPhotoDownloadingCompletionClosure?) {
    var storedError: NSError?
    for address in [PhotoURLString.overlyAttachedGirlfriend,
                    PhotoURLString.successKid,
                    PhotoURLString.lotsOfFaces] {
                      let url = URL(string: address)
                      let photo = DownloadPhoto(url: url!) { _, error in
                        if error != nil {
                          storedError = error
                        }
                      }
                      PhotoManager.shared.addPhoto(photo)
    }
    
    completion?(storedError)
  }
  
  private func postContentAddedNotification() {
    NotificationCenter.default.post(name: PhotoManagerNotification.contentAdded, object: nil)
  }
}
