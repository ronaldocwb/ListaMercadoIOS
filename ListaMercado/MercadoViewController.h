//
//  br_com_agivis_mercadoViewController.h
//  ListaMercado
//
//  Created by Ronaldo Campos on 03/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MercadoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (nonatomic) NSInteger mercadoriaIndex;

- (IBAction)saveTapped:(id)sender;

@end
