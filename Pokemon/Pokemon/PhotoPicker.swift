//
//  PhotoPicker.swift
//  Pokemon
//
//  Created by Pedro Magalhães Troia on 27/12/2021.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable{
  
    @Binding var imageedit: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    typealias UIViewControllerType = UIImagePickerController
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(Photopicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        
        let photopicker: PhotoPicker
        
        init(Photopicker: PhotoPicker){
            self.photopicker = Photopicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage{
                photopicker.imageedit = image
            }else{
                
            }
            
            picker.dismiss(animated: true)
        }
    }
}

