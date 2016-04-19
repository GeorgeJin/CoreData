//
//  Information+CoreDataProperties.h
//  CoreData登录验证
//
//  Created by George Jin on 3/28/16.
//  Copyright © 2016 First-Tek. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Information.h"

NS_ASSUME_NONNULL_BEGIN

@interface Information (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *password;

@end

NS_ASSUME_NONNULL_END
