//
//  ImagePicker.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI
import PhotosUI

// Component để chọn ảnh từ thư viện
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var imageData: Data?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    // Cập nhật imageData trên main thread
                    DispatchQueue.main.async {
                        self.parent.imageData = (image as? UIImage)?.jpegData(compressionQuality: 0.8)
                    }
                }
            }
        }
    }
}
