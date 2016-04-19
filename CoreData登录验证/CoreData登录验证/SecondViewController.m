//
//  SecondViewController.m
//  CoreData登录验证
//
//  Created by George Jin on 3/28/16.
//  Copyright © 2016 First-Tek. All rights reserved.
//

#import "SecondViewController.h"
#import "Information+CoreDataProperties.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textF_Username;
@property (weak, nonatomic) IBOutlet UITextField *textF_Password;

- (IBAction)buttonAction_Done;
- (IBAction)buttonAction_Cancel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)buttonAction_Done {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (([self.textF_Username.text  isEqual: @""]) || ([self.textF_Password.text  isEqual: @""])) {
        UIAlertController *cont = [UIAlertController alertControllerWithTitle:@"Notice" message:@"Username or Password couldn't be none" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [cont addAction:okButton];
        [self presentViewController:cont animated:YES completion:nil];
    }
    else{
        
        Information *newInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Information" inManagedObjectContext:context];
        
        newInfo.username = self.textF_Username.text;
        newInfo.password = self.textF_Password.text;
        
        [context save:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

- (IBAction)buttonAction_Cancel {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}








@end
