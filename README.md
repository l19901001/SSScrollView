# SSScrollView
 简单无限轮播控件封装
![image](https://github.com/l19901001/SSScrollView/blob/master/images/demonstration.gif)
```
    SSScrollView *headerView = [[SSScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150) DragDirection:HeaderViewDragDirectionHorizontal];
    headerView.contentStyle = HeaderViewScrollViewImageViewStyle;
    headerView.rollingTime = 3.0;
    [headerView reloadheaderViewWithDatas:self.images];
 ```
