//
//  ChatViewController.m
//  Test
//
//  Created by John Zhao on 10/29/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatEntity.h"
#import "ChatMessageViewCell.h"

@interface ChatViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView                    *tableView;
@property (nonatomic, strong) NSMutableArray                        *messageArray;

@end



@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.messageArray = [NSMutableArray array];

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符，也可以";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的";
        [self.messageArray addObject:entity];
    }

    {
        ChatMessageEntity *entity = [[ChatMessageEntity alloc] init];
        entity.sender = [[Sender alloc] init];
        entity.sender.image = [UIImage imageNamed:@"chat_headimage"];
        entity.sender.name = @"Sender Name";
        entity.received = YES;
        entity.message = @"看你后台跟JPush集成的时候咋定义？手机号也是唯一的标识符";
        [self.messageArray addObject:entity];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *result = nil;

    id entity = [self.messageArray objectAtIndex:indexPath.row];
    if ([entity isKindOfClass:[ChatMessageEntity class]]) {
        ChatMessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatMessageCellIdentifier"];
        ChatMessageEntity *message = (ChatMessageEntity*)entity;
        [cell setChatEntity:message];
        result = cell;
    }

    return result;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0.0f;

    id item = [self.messageArray objectAtIndex:indexPath.row];
    if ([item isKindOfClass:[ChatMessageEntity class]]) {
        ChatMessageEntity *entity = (ChatMessageEntity*)item;
        height = [ChatMessageViewCell calculateCellHeightWithEntity:entity width:tableView.bounds.size.width];
    }

    return height;
}

@end
