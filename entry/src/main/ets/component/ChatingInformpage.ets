import { prompt, router } from '@kit.ArkUI'

@Entry
@Component
struct ChatSettingsPage {
  @State isMute: boolean = false
  @State isPinned: boolean = false

  build() {
    Column() {
      // 标题栏
      Row() {
        Image($r('app.media.back'))
          .width(24)
          .height(24)
          .margin({ left: 16 })
          .onClick(() => {
            router.back()
          })

        Text('聊天信息')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 100 })
          .fontColor('#000000')

        Blank()
      }
      .width('100%')
      .height(56)
      .backgroundColor('#FFFFFF')
      .alignItems(VerticalAlign.Center)

      Row() {
        // 头像
        Image($r('app.media.avatar')) // 用户头像
          .width(80)
          .height(80)
          .borderRadius(4)
          .border({ width: 1, color: '#F0F0F0' })
          .margin({ left: 16 })

      }
      .width('100%')
      .backgroundColor('#FFFFFF')

      Row() {
        // 昵称
        Text('啊琳')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ left: 44 })

      }
      .width('100%')
      .backgroundColor('#FFFFFF')

      // 分隔线
      Divider()
        .strokeWidth(10)
        .color('#F0F0F0')

      Row() {
        Text('查找聊天记录')
          .fontSize(16)
          .margin({ left: 20 })

        Image($r('app.media.right'))
          .width(24)
          .height(24)
          .margin({ left: 203 })
      }
      .height(48)
      .width('100%')
      .backgroundColor('#FFFFFF')
      .onClick(() => {
        //
      })

      // 功能列表
      Column() {

        // 分隔线
        Divider()
          .strokeWidth(0.5)
          .color('#F0F0F0')
          .margin({ left: 56 })

        // 消息免打扰
        Row() {

          Text('消息免打扰')
            .fontSize(16)
            .fontColor('#000000')
            .margin({ left: 20 })
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.isMute })
            .onChange((isOn: boolean) => {
              this.isMute = isOn
            })
            .margin({ right: 16 })
        }
        .height(48)
        .width('100%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          this.isMute = !this.isMute
        })

        // 分隔线
        Divider()
          .strokeWidth(2)
          .color('#F0F0F0')

        // 置顶聊天
        Row() {
          Text('置顶聊天')
            .fontSize(16)
            .fontColor('#000000')
            .margin({ left: 20 })
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.isPinned })
            .onChange((isOn: boolean) => {
              this.isPinned = isOn
            })
            .margin({ right: 16 })
        }
        .height(48)
        .width('100%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          this.isPinned = !this.isPinned
        })

        // 分隔线
        Divider()
          .strokeWidth(2)
          .color('#F0F0F0')

        // 置顶聊天
        Row() {
          Text('提醒')
            .fontSize(16)
            .fontColor('#000000')
            .margin({ left: 20 })
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.isPinned })
            .onChange((isOn: boolean) => {
              this.isPinned = isOn
            })
            .margin({ right: 16 })
        }
        .height(48)
        .width('100%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          this.isPinned = !this.isPinned
        })

        // 分隔线
        Divider()
          .strokeWidth(10)
          .color('#F0F0F0')

        Row() {
          Text('设置当前聊天背景')
            .fontSize(16)
            .margin({ left: 20 })

          Image($r('app.media.right'))
            .width(24)
            .height(24)
            .margin({ left: 170 })
        }
        .height(48)
        .width('100%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          //
        })

        // 分隔线
        Divider()
          .strokeWidth(10)
          .color('#F0F0F0')
        // 清空聊天记录
        Row() {
          Text('清空聊天记录')
            .fontSize(16)
            .margin({ left: 20 })
          Image($r('app.media.right'))
            .width(24)
            .height(24)
            .margin({ left: 200 })
        }
        .height(48)
        .width('100%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          //
        })

        // 分隔线
        Divider()
          .strokeWidth(10)
          .color('#F0F0F0')

        // 投诉（红色文字）
        Row() {
          Text('投诉')
            .fontSize(16)
            .margin({ left: 20 })
          Image($r('app.media.right'))
            .width(24)
            .height(24)
            .margin({ left: 264 })
        }
        .height(48)
        .width('100%')
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          // 跳转到投诉页面
        })
      }
      .margin({ top: 8 })
      .width('100%')
      .backgroundColor('#FFFFFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  buildMenuItem(icon: Resource, text: string) {
    Row() {
      Image($r(`app.media.${icon}`))
        .width(24)
        .height(24)
        .margin({ left: 16, right: 16 })
      Text(text)
        .fontSize(16)
        .fontColor('#000000')
    }
    .height(48)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .onClick(() => {
      // 通用点击事件处理
    })
  }
}