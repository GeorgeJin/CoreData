//
//  AccountViewController.m
//  CoreData登录验证
//
//  Created by George Jin on 3/29/16.
//  Copyright © 2016 First-Tek. All rights reserved.
//

#import "AccountViewController.h"
#import "Information+CoreDataProperties.h"

@interface AccountViewController () 

@property (weak, nonatomic) IBOutlet UITextField *textF_OldPwd;
@property (weak, nonatomic) IBOutlet UITextField *textF_NewPwd;
@property (weak, nonatomic) IBOutlet UITextField *textF_VerifyPwd;

- (IBAction)buttonAction_Save:(id)sender;

@end


@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


- (IBAction)buttonAction_Save:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Information"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"password == %@", self.textF_OldPwd.text];
    request.predicate = pre;
    
    NSArray *infos = [context executeFetchRequest:request error:nil];
    
    for (Information *newInfo in infos) {
        newInfo.password = self.textF_NewPwd.text;
    }
    
    [context save:nil];
    
    
}




























@end
