//
//  MediaManager.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 13/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices
import NohanaImagePicker
import MediaPlayer

enum AttachmentType: String{
    case camera, video, photoLibrary, audio
}

class MediaManager: NSObject {
    
    static let shared = MediaManager()
    fileprivate var currentVC: UIViewController?
    //MARK: - Internal Properties
    var imagePickedBlock: ((UIImage) -> Void)?
    var multipeImagePickedBlock: (([CreatePostListOfForumPostAttachmentsModel]) -> Void)?
    var videoPickedBlockCustome: (([CreatePostListOfForumPostAttachmentsModel]) -> Void)?
    var videoPickedBlock: ((NSURL) -> Void)?
    var filePickedBlock: ((NSURL) -> Void)?
    
    func showAttachmentActionSheet(vc: UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: MediaAccess.actionFileTypeHeading, message: MediaAccess.actionFileTypeDescription, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.camera, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .camera, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.phoneLibrary, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .photoLibrary, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.video, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .video, vc: self.currentVC!)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.file, style: .default, handler: { (action) -> Void in
            self.documentPicker()
        }))
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.cancelBtnTitle, style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }

    func showEditImageActionSheet(vc: UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: MediaAccess.actionFileTypeHeading, message: MediaAccess.actionFileTypeDescription, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.camera, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .camera, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.phoneLibrary, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .photoLibrary, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: MediaAccess.cancelBtnTitle, style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }
    
    
    func authorisationStatus(attachmentTypeEnum: AttachmentType, vc: UIViewController){
        currentVC = vc
        if attachmentTypeEnum ==  AttachmentType.camera{
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            switch status{
            case .authorized: // The user has previously granted access to the camera.
                self.openCamera()
                
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        DispatchQueue.main.async {
                            self.openCamera()
                        }
                    }
                }
                //denied - The user has previously denied access.
            //restricted - The user can't grant access due to restrictions.
            case .denied, .restricted:
                self.showSimpleAlert(AlertMsg.TITLE, message: AlertMsg.MEDIA_PERMITION)
                return
                
            default:
                break
            }
        }else if attachmentTypeEnum == AttachmentType.photoLibrary || attachmentTypeEnum == AttachmentType.video{
            let status = PHPhotoLibrary.authorizationStatus()
            switch status{
            case .authorized:
                if attachmentTypeEnum == AttachmentType.photoLibrary{
                    self.photoLibrary()
//                    self.showLargeThumbnailPicker()
                }
                
                if attachmentTypeEnum == AttachmentType.video{
                    videoLibrary()
                }
            case .denied, .restricted:
                self.showSimpleAlert(AlertMsg.TITLE, message: AlertMsg.MEDIA_PERMITION)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({ (status) in
                    if status == PHAuthorizationStatus.authorized{
                        // photo library access given
//                        self.photoLibrary()
                        DispatchQueue.main.async {
                            //self.showLargeThumbnailPicker()
                            self.photoLibrary()
                        }
                    }
                    if attachmentTypeEnum == AttachmentType.video{
                        self.videoLibrary()
                    }
                })
            default:
                break
            }
        } else if attachmentTypeEnum == AttachmentType.audio {
            
            if #available(iOS 9.3, *) {
                let status = MPMediaLibrary.authorizationStatus()
                
                switch status{
                case .authorized: // The user has previously granted access to the audio.
                    self.audioPicker()

                case .notDetermined: // The user has not yet been asked for audio access.
                    MPMediaLibrary.requestAuthorization({(newPermissionStatus: MPMediaLibraryAuthorizationStatus) in
                        if newPermissionStatus == .authorized {
                            DispatchQueue.main.async {
                                self.audioPicker()
                            }
                        }
                    })
                    break
                //denied - The user has previously denied access.
                //restricted - The user can't grant access due to restrictions.
                case .denied, .restricted:
                    self.showSimpleAlert(AlertMsg.TITLE, message: AlertMsg.MEDIA_PERMITION)
                    return
                    
                default:
                    break
                }
            } else {
                // Fallback on earlier versions
                self.showSimpleAlert(AlertMsg.TITLE, message: AlertMsg.OS_ERROR)

            }
        }
    }

    func authorisationStatus(withLimit limit: Int, attachmentTypeEnum: AttachmentType, vc: UIViewController){
        currentVC = vc
        if attachmentTypeEnum ==  AttachmentType.camera{
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            switch status{
            case .authorized: // The user has previously granted access to the camera.
                self.openCamera()
                
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        DispatchQueue.main.async {
                            self.openCamera()
                        }
                    }
                }
                //denied - The user has previously denied access.
            //restricted - The user can't grant access due to restrictions.
            case .denied, .restricted:
                self.showSimpleAlert(AlertMsg.TITLE, message: AlertMsg.MEDIA_PERMITION)
                return
                
            default:
                break
            }
        }else if attachmentTypeEnum == AttachmentType.photoLibrary || attachmentTypeEnum == AttachmentType.video{
            let status = PHPhotoLibrary.authorizationStatus()
            switch status{
            case .authorized:
                if attachmentTypeEnum == AttachmentType.photoLibrary{
                    //                    self.photoLibrary()
                    self.showLargeThumbnailPicker(with: limit)
                }
                
                if attachmentTypeEnum == AttachmentType.video{
                    videoLibrary()
                }
            case .denied, .restricted:
                self.showSimpleAlert(AlertMsg.TITLE, message: AlertMsg.MEDIA_PERMITION)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization({ (status) in
                    if status == PHAuthorizationStatus.authorized{
                        // photo library access given
                        DispatchQueue.main.async {
                            self.showLargeThumbnailPicker()
                        }
                    }
                    if attachmentTypeEnum == AttachmentType.video{
                        self.videoLibrary()
                    }
                })
            default:
                break
            }
        }
    }
    
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
//            myPickerController.allowsEditing = true
            currentVC?.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            currentVC?.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func videoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeVideo as String]
            currentVC?.present(myPickerController, animated: true, completion: nil)
        }
    }

    func documentPicker(){
        let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        currentVC?.present(importMenu, animated: true, completion: nil)
    }

    func audioPicker(){
        let mediaPicker = MPMediaPickerController(mediaTypes: .music)
        mediaPicker.delegate = self
        currentVC?.present(mediaPicker, animated: true, completion: nil)
    }

    
    // MARK: - Show NohanaImagePicker
    
    @objc func showDefaultPicker() {
        let picker = NohanaImagePickerController()
        picker.delegate = self
        currentVC?.present(picker, animated: true, completion: nil)
    }
    
    @objc func showLargeThumbnailPicker() {
        let picker = NohanaImagePickerController()
        picker.delegate = self
        picker.numberOfColumnsInPortrait = 2
        picker.numberOfColumnsInLandscape = 3
        picker.maximumNumberOfSelection = 5
        currentVC?.present(picker, animated: true, completion: nil)
    }
    
    @objc func showLargeThumbnailPicker(with limit:Int) {
        let picker = NohanaImagePickerController()
        picker.delegate = self
        picker.numberOfColumnsInPortrait = 2
        picker.numberOfColumnsInLandscape = 3
        picker.maximumNumberOfSelection = limit
        currentVC?.present(picker, animated: true, completion: nil)
    }


    @objc func showNoToolbarPicker() {
        let picker = NohanaImagePickerController()
        picker.delegate = self
        picker.toolbarHidden = true
        currentVC?.present(picker, animated: true, completion: nil)
    }
    
    @objc func showDisableToPickAssetsPicker() {
        let picker = NohanaImagePickerController()
        picker.delegate = self
        picker.canPickAsset = { (asset: Asset) -> Bool in
            return asset.identifier % 2 == 0
        }
        currentVC?.present(picker, animated: true, completion: nil)
    }
    
    @objc func showCustomUIPicker() {
        let picker = NohanaImagePickerController()
        picker.delegate = self
        picker.config.color.background = UIColor(red: 0xcc/0xff, green: 0xff/0xff, blue: 0xff/0xff, alpha: 1)
        picker.config.color.separator = UIColor(red: 0x00/0xff, green: 0x66/0xff, blue: 0x66/0xff, alpha: 1)
        picker.config.strings.albumListTitle = "🏞"
        picker.config.image.droppedSmall = UIImage(named: "btn_select_m")
        picker.config.image.pickedSmall = UIImage(named: "btn_selected_m")
        currentVC?.present(picker, animated: true, completion: nil)
    }

    
}
extension MediaManager : MPMediaPickerControllerDelegate {
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
        //User selected a/an item(s).
        for mpMediaItem in mediaItemCollection.items {
            print("Add \(mpMediaItem) to a playlist, prep the player, etc.")
            print("url", mpMediaItem.assetURL! as NSURL)
            self.filePickedBlock?(mpMediaItem.assetURL! as NSURL)
        }
    }
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        currentVC?.dismiss(animated: true, completion: nil)
    }
}
extension MediaManager : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // To handle image
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imagePickedBlock?(image.upOrientationImage()!)
        } else{
            print("Something went wrong in  image")
        }
        // To handle video
        if let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as? NSURL{
            print("videourl: ", videoUrl)
            //trying compression of video
            let data = NSData(contentsOf: videoUrl as URL)!
            print("File size before compression: \(Double(data.length / 1048576)) mb")
            
            if (Double(data.length / 1048576) > 700)
            {
                currentVC?.showSimpleAlert(AlertMsg.TITLE, message: "You can not upload video bigger than 700 mb.")
            }
            else
            {

                DispatchQueue.main.async {
                    AppDelegate.shared().ShowSpinnerView()
                }
                
                 let compressedURL = NSURL.fileURL(withPath: NSTemporaryDirectory() + NSUUID().uuidString + ".m4v")
                
                compressVideo(inputURL: videoUrl as URL, outputURL: compressedURL) { (exportSession) in
                         guard let session = exportSession else {
                             return
                         }

                         switch session.status {
                         case .unknown:
                             break
                         case .waiting:
                             break
                         case .exporting:
                             break
                         case .completed:
                            DispatchQueue.main.async {
                                AppDelegate.shared().HideSpinnerView()
                            }
                             guard let compressedData = NSData(contentsOf: compressedURL) else {
                                self.videoPickedBlock?(videoUrl)
                                 return
                             }
                             self.videoPickedBlock?(compressedURL as NSURL)

                            print("File size after compression: \(Double(compressedData.length / 1048576)) mb")
                         case .failed:
                             break
                         case .cancelled:
                             break
                         }
                     }
                }

        }
        else{
            print("Something went wrong in  video")
            currentVC?.showSimpleAlert("invalid", message: "the selected video is not valid.")
        }
        currentVC?.dismiss(animated: true, completion: nil)
    }
}

extension MediaManager : UIDocumentMenuDelegate, UIDocumentPickerDelegate {
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        currentVC?.present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("url", url)
        self.filePickedBlock?(url as NSURL)
    }
    
    //    Method to handle cancel action.
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        currentVC?.dismiss(animated: true, completion: nil)
    }

    //MARK:- ~~~~~~~~~~ Show Alert
    
    func showSimpleAlert(_ title: String, message : String){        
        if message.isNull == false
        {
            let alertView = DTAlertView.init(block: { (alert, buttonIndex, cancelButtonIndex) in
                debugPrint(buttonIndex)
                debugPrint(cancelButtonIndex)
            }, title: title, message: message, cancelButtonTitle: STR_COMMON.OK, positiveButtonTitle: nil)
            alertView?.show()
        }
    }
    
    func compressVideo(inputURL: URL, outputURL: URL, handler:@escaping (_ exportSession: AVAssetExportSession?)-> Void) {
        
        //Utility.setVPC(Utility.getVPC() + 1)
           let urlAsset = AVURLAsset(url: inputURL, options: nil)
           guard let exportSession = AVAssetExportSession(asset: urlAsset, presetName: Utility.getVPC() % 2 == 0 ? AVAssetExportPresetMediumQuality : AVAssetExportPresetLowQuality) else {
               handler(nil)
               return
           }

           exportSession.outputURL = outputURL
           exportSession.outputFileType = AVFileType.mov
           exportSession.shouldOptimizeForNetworkUse = true
           exportSession.exportAsynchronously { () -> Void in
               handler(exportSession)
           }
       }
}
extension MediaManager : NohanaImagePickerControllerDelegate {
    // MARK: - NohanaImagePickerControllerDelegate
    
    func nohanaImagePickerDidCancel(_ picker: NohanaImagePickerController) {
        print("🐷Canceled🙅")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didFinishPickingPhotoKitAssets pickedAssts: [PHAsset]) {
        print("🐷Completed🙆\n\tpickedAssets = \(pickedAssts)")
        
        var images:[CreatePostListOfForumPostAttachmentsModel] = [CreatePostListOfForumPostAttachmentsModel]()
        for asset in pickedAssts
        {
            let requestOptions = PHImageRequestOptions()
            requestOptions.resizeMode = PHImageRequestOptionsResizeMode.exact
            requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
            // this one is key
            requestOptions.isSynchronous = true

            if (asset.mediaType == PHAssetMediaType.image)
            {
                let block = CreatePostListOfForumPostAttachmentsModel()
                PHImageManager.default().requestImage(for: asset , targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.default, options: requestOptions, resultHandler: { (pickedImage, info) in
                    block.imagePost = pickedImage
                    block.fileName = (asset.value(forKey: "filename") as! String)
                    images.append(block)
                })
            }
        }
        multipeImagePickedBlock?(images)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, willPickPhotoKitAsset asset: PHAsset, pickedAssetsCount: Int) -> Bool {
        print("🐷\(#function)\n\tasset = \(asset)\n\tpickedAssetsCount = \(pickedAssetsCount)")
        return true
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didPickPhotoKitAsset asset: PHAsset, pickedAssetsCount: Int) {
        print("🐷\(#function)\n\tasset = \(asset)\n\tpickedAssetsCount = \(pickedAssetsCount)")
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, willDropPhotoKitAsset asset: PHAsset, pickedAssetsCount: Int) -> Bool {
        print("🐷\(#function)\n\tasset = \(asset)\n\tpickedAssetsCount = \(pickedAssetsCount)")
        return true
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didDropPhotoKitAsset asset: PHAsset, pickedAssetsCount: Int) {
        print("🐷\(#function)\n\tasset = \(asset)\n\tpickedAssetsCount = \(pickedAssetsCount)")
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didSelectPhotoKitAsset asset: PHAsset) {
        print("🐷\(#function)\n\tasset = \(asset)\n\t")
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, didSelectPhotoKitAssetList assetList: PHAssetCollection) {
        print("🐷\(#function)\n\t\tassetList = \(assetList)\n\t")
    }
    
    func nohanaImagePickerDidSelectMoment(_ picker: NohanaImagePickerController) -> Void {
        print("🐷\(#function)")
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, assetListViewController: UICollectionViewController, cell: UICollectionViewCell, indexPath: IndexPath, photoKitAsset: PHAsset) -> UICollectionViewCell {
        print("🐷\(#function)\n\tindexPath = \(indexPath)\n\tphotoKitAsset = \(photoKitAsset)")
        return cell
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, assetDetailListViewController: UICollectionViewController, cell: UICollectionViewCell, indexPath: IndexPath, photoKitAsset: PHAsset) -> UICollectionViewCell {
        print("🐷\(#function)\n\tindexPath = \(indexPath)\n\tphotoKitAsset = \(photoKitAsset)")
        return cell
    }
    
    func nohanaImagePicker(_ picker: NohanaImagePickerController, assetDetailListViewController: UICollectionViewController, didChangeAssetDetailPage indexPath: IndexPath, photoKitAsset: PHAsset) {
        print("🐷\(#function)\n\tindexPath = \(indexPath)")
    }

}
