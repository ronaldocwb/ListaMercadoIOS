//
//  Mercadoria.h
//  ListaMercado
//
//  Created by Ronaldo Campos on 05/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import <Foundation/Foundation.h>

//TODO poderia ser um struct no lugar?
@interface Mercadoria : NSObject

@property (strong, nonatomic) NSString *nome;
@property (nonatomic) NSInteger quantidade;
@property (nonatomic) BOOL importante;

@end
