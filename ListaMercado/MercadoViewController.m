//
//  br_com_agivis_mercadoViewController.m
//  ListaMercado
//
//  Created by Ronaldo Campos on 03/02/14.
//  Copyright (c) 2014 Ronaldo Campos. All rights reserved.
//

#import "MercadoViewController.h"
#import "MercadoAppDelegate.h"
#import "Mercadoria.h"

@interface MercadoViewController (){
    
    MercadoAppDelegate *appDelegate;
    
    IBOutlet UITextField *produto;
    IBOutlet UITextField *quantidade;
    IBOutlet UISwitch *importante;
}

@end

@implementation MercadoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    appDelegate = [UIApplication sharedApplication].delegate;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.mercadoriaIndex >= 0) {
        Mercadoria *m = [appDelegate.repository getMercadoria:self.mercadoriaIndex];
        
        produto.text = m.nome;
        quantidade.text = [NSString stringWithFormat: @"%d", (int)m.quantidade];
        [importante setOn:m.importante];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveTapped:(id)sender{
    Mercadoria *m1 = [[Mercadoria alloc] init];
    m1.nome = produto.text;
    m1.quantidade = quantidade.text.integerValue;
    m1.importante = importante.isOn;
    
    if (self.mercadoriaIndex >= 0) {
        [appDelegate.repository addMercadoria:m1 :self.mercadoriaIndex];
    } else {
        [appDelegate.repository addMercadoria:m1];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
