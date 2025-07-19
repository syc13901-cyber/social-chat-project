import WindowManager from '../utils/WindowManager'

interface User {
    name: string;
    avatar: Resource;
}

interface MomentItem {
    user: User;
    content: string;
    time: string;
}

@Entry
@Component
export struct Dynamic{
    // 示例动态数据
    @State moments: MomentItem[] = [
        {
            user: {
                name: '困告Cu',
                avatar: $r('app.media.ic_user_head1')
            } as User,
            content: '今天的猫猫很有精神！',
            time: '2分钟前'
        },
        {
            user: {
                name: 'vicky',
                avatar: $r('app.media.ic_user_head2'),
            },
            content: '炸鸡配动漫，快乐加倍！',
            time: '8分钟前'
        },
        {
            user: {
                name: 'CI',
                avatar: $r('app.media.ic_user_head3'),
            },
            content: '和大海的夏天',

            time: '10分钟前'
        },
    ]

    build() {
        Column() {
            // 顶部背景和头像
            Stack() {
                Image($r('app.media.ic_user_head7'))
                    .width('100%')
                    .height(220)
                    .objectFit(ImageFit.Cover)
                // 头像和昵称
                Row() {
                    Blank().layoutWeight(1)
                    Column() {
                        Text('Moa')
                            .fontColor(Color.White)
                            .fontSize(15)
                            .fontWeight(FontWeight.Bold)
                            .margin({ bottom: 8 })
                        Image($r('app.media.ic_user_head4'))
                            .width(56)
                            .height(56)
                            .borderRadius(12)
                    }
                    .margin({ right: 20, bottom: 10 })
                }
                .alignItems(VerticalAlign.Bottom)
                .height(220)
                .width('100%')
            }
            // “朋友的新动态”入口
            Row() {
                Text('朋友的新动态')
                    .fontColor('#222')
                    .fontSize(16)
                    .margin({ left: 20 })
                Blank()
                Image($r('app.media.ic_user_head7'))
                    .width(32)
                    .height(32)
                    .borderRadius(8)
                    .margin({ right: 10 })
                Image($r('app.media.ic_more'))
                    .width(16)
                    .height(16)
                    .margin({ right: 20 })
            }
            .height(48)
            .backgroundColor(Color.White)
            .alignItems(VerticalAlign.Center)
            .width('100%')
            // 动态列表
            List() {
                ForEach(this.moments, (item: MomentItem) => {
                    ListItem() {
                        this.buildMomentItem(item)
                    }
                })
            }
            .backgroundColor('#f7f7f7')
            .width('100%')
            .height('100%')
            .layoutWeight(1)
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#f7f7f7')
        .padding({ bottom: WindowManager.navBarHeight })
    }

    @Builder
    buildMomentItem(item: MomentItem) {
        Column() {
            Row() {
                Image(item.user.avatar)
                    .width(40)
                    .height(40)
                    .borderRadius(8)
                Column() {
                    Text(item.user.name)
                        .fontColor('#222')
                        .fontSize(15)
                        .fontWeight(FontWeight.Bold)
                    Text(item.content)
                        .fontColor('#444')
                        .fontSize(14)
                        .margin({ top: 4 })
                    Text(item.time)
                        .fontColor('#999')
                        .fontSize(12)
                        .margin({ top: 8 })
                }
                .margin({ left: 10 })
                Blank()
                Image($r('app.media.ic_more'))
                    .width(20)
                    .height(20)
                    .margin({ right: 10 })
            }
            .margin({ top: 16, left: 16, right: 16 })
            Divider().color('#eee').strokeWidth(1).margin({ top: 16 })
        }
        .backgroundColor(Color.White)
        .borderRadius(12)
        .margin({ top: 8, left: 8, right: 8 })
    }
    @Builder
    buildImageGrid(images: Resource[]) {
        Column() {
            ForEach(Array.from({ length: Math.ceil(images.length / 3) }), (rowIdx: number) => {
                Row() {
                    ForEach(Array.from({ length: 3 }), (colIdx: number) => {
                        // 使用表达式方式计算 imgIdx，避免 let 声明
                        if (rowIdx * 3 + colIdx < images.length) {
                            Image(images[rowIdx * 3 + colIdx])
                                .width(70)
                                .height(70)
                                .margin({ right: colIdx < 2 ? 6 : 0, bottom: rowIdx < Math.ceil(images.length / 3) - 1 ? 6 : 0 })
                                .borderRadius(8)
                                .objectFit(ImageFit.Cover)
                        }
                    })
                }
            })
        }
    }
}



