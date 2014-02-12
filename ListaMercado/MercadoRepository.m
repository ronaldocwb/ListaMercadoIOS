//
//  MercadoRepository.m
//  ListaMercado
//
//  Created by Ronaldo Campos on 05/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import "MercadoRepository.h"
#import "Mercadoria.h"

@implementation MercadoRepository

- (id)init{
    self = [super self];
    
    self.mercadorias = [[NSMutableArray alloc] init];
    
    return self;
}

- (Mercadoria *)getMercadoria:(NSInteger)index{
    //TODO Por que usar esse asterisco antes do index
    return [self.mercadorias objectAtIndex:index];
}

- (NSArray *)getAll{
    [self sortMercadoriasByName];
    return [NSArray arrayWithArray:self.mercadorias];
}

- (NSArray *)getAllImportant{
    [self sortMercadoriasByName];
    
    NSMutableArray *importants = [[NSMutableArray alloc] init];
    
    for (Mercadoria *m in self.mercadorias) {
        if(m.importante){
            [importants addObject:m];
        }
    }
    
    return [NSArray arrayWithArray:importants];
}


- (void)addMercadoria:(Mercadoria *)m{
    [self.mercadorias addObject:m];
}

- (void)addMercadoria:(Mercadoria *)m :(NSInteger)index{
    self.mercadorias[index] = m;
}

- (void) removeMercadoria:(Mercadoria *)m{
    for (Mercadoria *m2 in self.mercadorias) {
        if([m.nome isEqual:m2]){
            [self.mercadorias removeObject:m2];
        }
    }
}

- (void) removeMercadoriaByIndex:(NSInteger)index{
    [self.mercadorias removeObjectAtIndex:index];
}

- (void) sortMercadoriasByName{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome" ascending:YES];
    NSArray *sortedArray =[self.mercadorias sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    //for (int x=0; [sortedArray count]; x++) {
    //    self.mercadorias[x] = sortedArray[x];
    //}
    
    self.mercadorias = [sortedArray mutableCopy];
}

@end
