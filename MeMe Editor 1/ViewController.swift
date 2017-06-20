//
//  ViewController.swift
//  MeMe Editor 1
//
//  Created by Michael Sumrall on 6/19/17.
//  Copyright © 2017 Michael Sumrall. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var albumButton: UIButton!
    @IBOutlet weak var memeViewer: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var textBox1: UITextField!{ didSet  {
        textBox1.text = textBox1DefaultValue
        textBox1.defaultTextAttributes = memeTextAttributes
        textBox1.delegate = self
        }
    }
    
    @IBOutlet weak var textBox2: UITextField!{ didSet {
    textBox2.text = textBox2DefaultValue
    textBox2.defaultTextAttributes = memeTextAttributes
    textBox2.delegate = self
}
    }

    //Text settings
    let memeTextAttributes = [ NSStrokeWidthAttributeName: -3.0, NSForegroundColorAttributeName: UIColor.red, NSStrokeColorAttributeName: UIColor.black, NSFontAttributeName: UIFont(name: "Arial", size: 30)!] as [String: Any]
    
    //Album Feature
    @IBAction func albumButton(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.isEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    // Camera Feature
    @IBAction func CameraButton(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.isEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Text Box settings
        
        textBox1.isHidden = false
        textBox1.defaultTextAttributes = memeTextAttributes
        textBox1.textAlignment = NSTextAlignment.center
        textBox1.delegate = self
        textBox2.isHidden = false
        textBox2.defaultTextAttributes = memeTextAttributes
        textBox2.textAlignment = NSTextAlignment.center
        textBox2.delegate = self
        
        
    }
    //Camera Feature
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    //Album Feature
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        memeViewer.image = image
        dismiss(animated: true, completion: nil)
    }
    

    }
    var memeImage : UIImage!
    let textBox1DefaultValue = "Top"
    let textBox2DefaultValue = "Bottom"
    
    
  }


