//
//  ViewController.m
//  CoreData登录验证
//
//  Created by George Jin on 3/28/16.
//  Copyright © 2016 First-Tek. All rights reserved.
//

#import "ViewController.h"
#import "Information+CoreDataProperties.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textF_UserName;
@property (weak, nonatomic) IBOutlet UITextField *textF_Password;

- (IBAction)buttonAction_Login;
@property (nonatomic, strong) NSArray *infos;

@end

@implementation ViewController

- (NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)buttonAction_Login {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Information"];
    
    NSString *userName = self.textF_UserName.text;
    NSString *passWord = self.textF_Password.text;
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"username = %@ AND password = %@", userName, passWord];
    request.predicate = pre;
    
    if ([[context executeFetchRequest:request error:nil] lastObject]) {
        [self performSegueWithIdentifier:@"jjj" sender:self];
    }
    else{
        UIAlertController *cont = [UIAlertController alertControllerWithTitle:@"Notice" message:@"Username or Password doesn't exist" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [cont addAction:okButton];
        [self presentViewController:cont animated:YES completion:nil];
    }
    
    
}


@end
