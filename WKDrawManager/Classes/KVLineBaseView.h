//
//  KVLineBaseView.h
//  KavinDrawTool
//
//  Created by sgx_02 on 2021/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVLineBaseView : UIView
/** 折线图Y轴坐标数组*/
@property (nonatomic, strong) NSArray *yValueData;


/** 折线图X轴坐标数组*/
@property (nonatomic, strong) NSArray *xValueData;


/** 与X轴平行的分割线间距（表示各个Y轴所对应数字值的辅助线）*/
@property (nonatomic, assign) CGFloat rowMarkLineSpace;


/** 设置与X 轴平行的辅助线个数 不设置的话，默认与yvalueData 个数相等*/
@property (nonatomic, assign) NSInteger rowMarkLineCount;


/** 与Y轴平行的分割线间距（表示各个X轴所对应数字值的辅助线）*/
@property (nonatomic, assign) CGFloat colMarkLineSpace;


/** 折线背景网格线的起始位置*/
@property (nonatomic, assign) CGPoint startPoint;


/** Y轴长度*/
@property (nonatomic, assign) CGFloat yLineHeight;


/** X轴长度*/
@property (nonatomic, assign) CGFloat xLineWidth;


/** X轴坐标文本宽度*/
@property (nonatomic, assign) CGFloat xTextWidth;


/** Y轴坐标文本宽度*/
@property (nonatomic, assign) CGFloat yTextWidth;


/** X轴坐标文本高度*/
@property (nonatomic, assign) CGFloat xTextHeight;


/** Y轴坐标文本高度*/
@property (nonatomic, assign) CGFloat yTextHeight;


/** Y轴坐标文本与Y轴之间的间距*/
@property (nonatomic, assign) CGFloat yTextSpaceOfYLine;


/** 设置X轴以及与X轴平行的辅助线虚线间距（xLineDashSpace 为0时，即为实线非虚线）*/
@property (nonatomic, assign) CGFloat xLineDashSpace;


/** 设置X轴以及与X轴平行的辅助线虚线每一小段的宽度*/
@property (nonatomic, assign) CGFloat xLineDashWidth;


/** 设置Y轴以及与Y轴平行的辅助线虚线间距（xLineDashSpace 为0时，即为实线非虚线）*/
@property (nonatomic, assign) CGFloat yLineDashSpace;


/** 设置Y轴以及与Y轴平行的辅助线虚线每一小段的宽度*/
@property (nonatomic, assign) CGFloat yLineDashWidth;


/** 设置X轴线条颜色*/
@property (nonatomic, strong) UIColor *xAxisLineColor;


/** 设置y轴线条颜色*/
@property (nonatomic, strong) UIColor *yAxisLineColor;


/** Y轴平行的辅助线颜色*/
@property (nonatomic, strong) UIColor *ySpaceLineColor;


/** X轴平行的辅助线颜色*/
@property (nonatomic, strong) UIColor *xSpaceLineColor;


/** 折线颜色*/
@property (nonatomic, strong) UIColor *lineStrokeColor;


/** 折线宽度*/
@property (nonatomic, assign) CGFloat lineStrokeWidth;


/** Y轴坐标文本字体大小*/
@property (nonatomic, strong) UIFont *yTextFont;


/** Y轴坐标文本字体颜色*/
@property (nonatomic, strong) UIColor *yTextColor;


/** X轴坐标文本字体大小*/
@property (nonatomic, strong) UIFont *xTextFont;


/** X轴坐标文本字体颜色*/
@property (nonatomic, strong) UIColor *xTextColor;

/** 设置折线最大值*/
@property (nonatomic, assign) CGFloat maxValue;

/** 设置渐变色数组
 *
 *  默认渐变色 @[(__bridge id)[UIColor colorWithRed:255/255.0 green:69/255.0 blue:0/255.0 alpha:0.8].CGColor,(__bridge id)[UIColor colorWithWhite:1 alpha:0.1].CGColor];
 *
 **/
@property (nonatomic, strong) NSArray *gradientColors;

/** 渐变范围数组*/
@property (nonatomic, strong) NSArray *gradientLocations;

/** 渐变起点*/
@property (nonatomic, assign) CGPoint gradientStartPoint;

/** 渐变终点*/
@property (nonatomic, assign) CGPoint gradientEndPoint;

/** 记录各点的坐标方便后边添加渐变阴影 和 点击层视图等 */
@property (nonatomic, strong, readonly) NSMutableArray *pointsArray;

/** 缓存layer 避免清除时闪退*/
@property (nonatomic, copy) NSMutableArray *tmpLayers;

/** 开始绘图*/
- (void)startDrawView;

/** 刷新折线图数据*/
- (void)reloadData;

/** 绘制折线图内容（此处拿出来，可用来重写该方法）*/
- (void)drawChartLine;

/** X轴坐标文本（此处拿出来，可用来重写该方法）*/
- (void)drawXtextLab;

/** Y轴坐标文本（此处拿出来，可用来重写该方法）*/
- (void)drawYtextLab;

/** 清空视图（此处拿出来，可用来重写该方法）*/
- (void)clearView;

/** 绘制渐变色（此处拿出来，可用来重写该方法）*/
- (void)drawGradient;



@end



NS_ASSUME_NONNULL_END
