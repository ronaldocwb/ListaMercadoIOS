//
//  MercadoRepository.h
//  ListaMercado
//
//  Created by Ronaldo Campos on 05/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mercadoria.h"

//TODO Nao esta achando as propriedades
//@class Mercadoria;

@interface MercadoRepository : NSObject

@property (strong, nonatomic) NSMutableArray *mercadorias;

- (NSArray *)getAll;
- (NSArray *)getAllImportant;
- (void) addMercadoria:(Mercadoria *)m;
- (void) addMercadoria:(Mercadoria *)m :(NSInteger)index;
- (void) removeMercadoria:(Mercadoria *)m;
- (Mercadoria *) getMercadoria:(NSInteger)index;
- (void) removeMercadoriaByIndex:(NSInteger)index;
- (void) sortMercadoriasByName;

@end
