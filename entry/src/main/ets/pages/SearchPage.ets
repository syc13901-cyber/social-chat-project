// SearchPage.ets
import { prompt, router } from '@kit.ArkUI'
interface GeneratedTypeLiteralInterface_1 {
  text: string;
}

@Entry
@Component
struct SearchPage {
  @State searchText: string = ''

  build() {
    Column() {
      // 搜索框部分
      Row() {//返回
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => {
            router.back()
          })
        Image($r('app.media.aa01')) // 使用已有图标替代
          .width(20)
          .height(24)
          .margin({ right: 12 })

        TextInput({ placeholder: '搜索' })
          .width('60%')
          .height(40)
          .fontSize(16)
          .onChange((value: string) => {
            this.searchText = value
          })

        Image($r('app.media.aa02'))
          .width(24)
          .height(24)


        if (this.searchText.length > 0) {
          Image($r('app.media.ic_public')) // 使用已有图标替代
            .width(20)
            .height(20)
            .onClick(() => {
              this.searchText = ''
            })
        }
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#f5f5f5')
      .borderRadius(20)
      .margin({ top: 10, bottom: 10 })

      // 搜索指定内容文本

      Row() {

        Text('搜索指定内容')
          .fontSize(14)
          .fontColor('#666666')

      } .width('100%')
        .justifyContent(FlexAlign.Start)

      // 分类标签 - 修改了字体大小、粗细和颜色
      Row() {
        Column() {
          Text('动态')
            .fontSize(16)  // 加大字体
            .fontWeight(FontWeight.Bold)  // 加粗
            .fontColor('#00BFFF')  // 天蓝色
            .margin({ top: 5 })
        }
        .margin({ right: 25 })

        Column() {
          Text('小程序')
            .fontSize(16)  // 加大字体
            .fontWeight(FontWeight.Bold)  // 加粗
            .fontColor('#00BFFF')  // 天蓝色
            .margin({ top: 5 })
        }
        .margin({ right: 25 })

        Column() {
          Text('表情')
            .fontSize(16)  // 加大字体
            .fontWeight(FontWeight.Bold)  // 加粗
            .fontColor('#00BFFF')  // 天蓝色
            .margin({ top: 5 })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 15, bottom: 20 })

      // 最近在搜和展开
      Row() {
        Text('最近在搜')
          .fontSize(14)
          .fontColor('#666666')

        Text('展开')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ left: 200 })

        Image($r('app.media.zhan01')) // 展开图标
          .width(16)
          .height(16)
          .margin({ left: 5 })

        Image($r('app.media.shan01')) // 展开图标
          .width(16)
          .height(16)
          .margin({ left: 5 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ left: 15 })
      .margin({ bottom: 15 })

      // 最近搜索项
      Column() {
        SearchItem({ text: '叙利亚宣布与乌克兰...' })
        SearchItem({ text: '嘉兴南湖工商联' })
      }
      .width('100%')

      // 分割线
      Divider()
        .strokeWidth(1)
        .color('#eeeeee')
        .margin({ top: 15, bottom: 15 })

      // 搜索发现标题 - 添加了左对齐样式
      Row() {
        Text('搜索发现')
          .fontSize(16)
          .fontColor('#333333')
          .margin({ left: 15, bottom: 15 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      // 搜索发现列表 - 确保内容左对齐
      Column() {
        ForEach([
          { text: '必胜客两家涉事门店被立案调查' },
          { text: '必胜客两家涉事门店被立案调查' },
          { text: '必胜客两家涉事门店被立案调查' },
          { text: '必胜客两家涉事门店被立案调查' },
          { text: '必胜客两家涉事门店被立案调查' }
        ], (item: GeneratedTypeLiteralInterface_1) => {
          Row() {
            SearchItem({ text: item.text })
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 15 })

      // 底部时间和取消按钮
      Row() {
        Text('页面设置')
          .fontSize(14)
          .fontColor('#00BFFF')
          .margin({ right: 20 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#ffffff')
  }
}

@Component
struct SearchItem {
  private text: string = ''

  build() {
    Row() {
      Text(this.text)
        .fontSize(16)
        .fontColor('#333333')

      Blank()

      Image($r('app.media.ru001')) // 使用已有图标替代
        .width(16)
        .height(16)
    }
    .width('100%')
    .height(50)
    .padding({ left: 15, right: 15 })
    .borderRadius(5)
    .backgroundColor('#ffffff')
    .onClick(() => {
      // 点击事件处理
    })
  }
}