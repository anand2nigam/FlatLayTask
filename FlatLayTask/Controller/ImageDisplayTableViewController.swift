//
//  ImageDisplayTableViewController.swift
//  FlatLayTask
//
//  Created by Anand Nigam on 16/09/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import UIKit

class ImageDisplayTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagesGallery: [UIImage] = [ ]
    
    let imagePicker = UIImagePickerController()
    
    // MARK:- Adding Images Methods
    @IBAction func addImageButtonTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Choose Image Source", message: "", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (alertAction) in
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            alert.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (alertAction) in
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            alert.addAction(photoLibraryAction)
        }
        
         alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK:- Configuring Image Picking
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            imagesGallery.append(selectedImage)
            tableView.reloadData()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK:- Loading Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        imagePicker.allowsEditing = true
        
       
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    // MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesGallery.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
        
        cell.selectedImageView.image = imagesGallery[indexPath.row]
         tableView.separatorStyle = .singleLine
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }

}
