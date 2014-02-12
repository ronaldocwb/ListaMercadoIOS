//
//  br_com_agivis_mercadoAppDelegate.h
//  ListaMercado
//
//  Created by Ronaldo Campos on 03/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MercadoRepository.h"

@interface MercadoAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MercadoRepository *repository;

@end
