//
//  ViewController.m
//  XXXXX
//
//  Created by Вова on 19.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *animals;
@property (nonatomic, strong) NSArray<UIImage *> *animalsImage;
@property (nonatomic, strong) NSArray<NSString *> *textAboutAnimals;
@property (nonatomic, strong) NSArray<NSString *> *subtextAboutAnimals;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.animals = @[@"Корова", @"Собака", @"Кошка", @"Кролик", @"Лиса"];
    self.animalsImage = @[@"cow.jpg", @"dog.jpg", @"cat.jpg", @"rabbit.jpeg", @"fox.jpeg"];
    self.textAboutAnimals = @[@"Коро́ва — ......",
                              @"Соба́ка — ......",
                              @"Ко́шка — ......",
                              @"Кролик - ......",
                              @"Лиса - ......"];
    self.subtextAboutAnimals = @[@"Какой то текст про коров",
                                 @"Какой-то текст про собак",
                                 @"Какой-то текст про кошек",
                                 @"Какой-то текст про кроликов",
                                 @"Какой-то текст про лис"];

    [self.tableView registerClass: [AnimalTableViewCell class] forCellReuseIdentifier:@"AnimalTableViewCell"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimalTableViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[AnimalTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"AnimalTableViewCell"];
    }
    
    NSString *title = self.animals[indexPath.row];
    cell.titleLabel.text = title;
    cell.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    NSString *subtitle = self.subtextAboutAnimals[indexPath.row];
    cell.subtitleLabel.text = subtitle;
    cell.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.coverImageView.image = [UIImage imageNamed:[self.animalsImage objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* title = self.textAboutAnimals[indexPath.row];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmActionButton = [UIAlertAction actionWithTitle:@"Понятно" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction: confirmActionButton];
    [self presentViewController: alertController animated: YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row % 2 == 0 ? 80 : 40;
}

@end
