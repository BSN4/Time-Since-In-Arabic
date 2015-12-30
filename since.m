/*
pass your timestamp to timeSinceNow and enjoy ! :)

code by : @phpfalcon
2014
*/

-(NSString *)timeSinceNow:(float)timestamp{
    NSMutableString *time = [[NSMutableString alloc]init];
    NSTimeInterval ti = [[NSDate date] timeIntervalSince1970];
    float diff = ti - timestamp;
    [time appendString:@"منذ "];

    //seconds
    if (diff<60) {
        
        int x = (int)floor(diff);
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"sec" timen:x]]];
    }
    //minutes
    if (diff>=60 && diff<60*60) {
        int x =  (int)floor(diff/(60));
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"min" timen:x]]];
    }
    //hours
    if (diff>=60*60 && diff<60*60*24 && (int)floor(diff/(60*60)) < 24) {
        int x = (int)floor(diff/(60*60));
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"hou" timen:x]]];
    } //days
    if (diff>=60*60*24 && diff<60*60*24*7) {
        int x = (int)floor(diff/(60*60*24));
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"day" timen:x]]];
    }
    //weeks
    if (diff>=60*60*24*7 && diff<60*60*24*30) {
        int x = (int)floor(diff/(60*60*24*7));
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"wek" timen:x]]];
    }
    //months
    if (diff>=60*60*24*30 && diff<60*60*24*365) {
        int x = (int)floor(diff/(60*60*24*30));
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"mon" timen:x]]];
    }
    //years
    if (diff>=60*60*24*365) {
        int x = (int)floor(diff/(60*60*24*365));
        [time appendString:[NSString stringWithFormat:@"%@", [self timeSinceNowWrap:@"yea" timen:x]]];
    }

    return time;
}
-(NSString *)timeSinceNowWrap:(NSString *)arf timen:(int)nrf{
    NSMutableString *time = [[NSMutableString alloc]init];
    
    //arrays
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@[@"ثانية", @"ثانيتين", @"ثوانٍ", @"ثانيةً", @"ثانيةٍ"] forKey:@"sec"];
    [dict setObject:@[@"دقيقة", @"دقيقتين", @"دقائق", @"دقيقةً", @"دقيقةٍ"] forKey:@"min"];
    [dict setObject:@[@"ساعة", @"ساعتين", @"ساعات", @"ساعةً", @"ساعةٍ"] forKey:@"hou"];
    [dict setObject:@[@"يوم", @"يومان", @"أيام", @"يوماً", @"يومٍ"] forKey:@"day"];
    [dict setObject:@[@"أسبوع", @"أسبوعين", @"أسابيع", @"أسبوعاً", @"أسبوعٍ"] forKey:@"wek"];
    [dict setObject:@[@"شهر", @"شهرين", @"شهور", @"شهراً", @"شهرٍ"] forKey:@"mon"];
    [dict setObject:@[@"سنة", @"سنتين", @"سنين", @"سنةً", @"سنةٍ"] forKey:@"yea"];
    
    if(![dict objectForKey:arf])
    {
        //wrong array
        return NULL;
    }
    
    //chosse right one
    NSArray *mya = [dict objectForKey:arf];
    
    
    if(nrf == 1)
    {
        [time appendString:mya[0]];
    }
    else if(nrf == 2)
    {
        [time appendString:mya[1]];
    }
    else if(nrf > 2 && nrf < 11)
    {
        [time appendFormat:@"%d %@", nrf, mya[2]];
    }
    else if(nrf > 10 && nrf < 100)
    {
        [time appendFormat:@"%d %@", nrf, mya[3]];
    }
    else if(nrf > 99)
    {
        [time appendFormat:@"%d %@", nrf, mya[4]];
    }
 
    return time;
}