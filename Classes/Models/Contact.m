//
//  Contact.m
//  Saccharin
//
//  Created by Adrian on 1/20/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize address = _address;
@synthesize altEmail = _altEmail;
@synthesize blog = _blog;
@synthesize department = _department;
@synthesize email = _email;
@synthesize facebook = _facebook;
@synthesize fax = _fax;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize linkedIn = _linkedIn;
@synthesize mobile = _mobile;
@synthesize phone = _phone;
@synthesize source = _source;
@synthesize title = _title;
@synthesize twitter = _twitter;
@synthesize birthDate = _birthDate;
@synthesize doNotCall = _doNotCall;

+ (NSString *)serverPath
{
    return @"contacts";
}

- (id)initWithCXMLElement:(CXMLElement *)element
{
    if (self = [super initWithCXMLElement:element])
    {
        for(int counter = 0; counter < [element childCount]; ++counter) 
        {
            id obj = [element childAtIndex:counter];
            NSString *nodeName = [obj name];
            if ([nodeName isEqualToString:@"address"])
            {
                _address = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"alt-email"])
            {
                _altEmail = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"blog"])
            {
                _blog = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"born-on"])
            {
                if ([obj stringValue] != nil)
                {
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
                    _birthDate = [[formatter dateFromString:[obj stringValue]] retain];
                    [formatter release];
                }
            }
            else if ([nodeName isEqualToString:@"department"])
            {
                _department = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"do-not-call"])
            {
                _doNotCall = [[obj stringValue] isEqualToString:@"true"];
            }
            else if ([nodeName isEqualToString:@"email"])
            {
                _email = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"facebook"])
            {
                _facebook = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"fax"])
            {
                _fax = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"first-name"])
            {
                _firstName = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"last-name"])
            {
                _lastName = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"linkedin"])
            {
                _linkedIn = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"mobile"])
            {
                _mobile = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"phone"])
            {
                _phone = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"source"])
            {
                _source = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"title"])
            {
                _title = [[obj stringValue] copy];
            }
            else if ([nodeName isEqualToString:@"twitter"])
            {
                _twitter = [[obj stringValue] copy];
            }
        }
    }
    return self;
}

- (void)dealloc
{
    [_address release];
    [_altEmail release];
    [_blog release];
    [_department release];
    [_email release];
    [_facebook release];
    [_fax release];
    [_firstName release];
    [_lastName release];
    [_linkedIn release];
    [_mobile release];
    [_phone release];
    [_source release];
    [_title release];
    [_twitter release];
    [_birthDate release];
    [super dealloc];
}

- (NSString *)description
{
    return _phone;
}

- (NSString *)name
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end