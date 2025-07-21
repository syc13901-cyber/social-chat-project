import { ChatContentItemData } from '../pages/chat/ChatContentItemData'
import AudioRendererManager from '../utils/AudioRendererManager'

@Preview
@Component
export default struct ListChatContentRightItem {// 聊天内容-右侧
  data?: ChatContentItemData
  userAvatar?: string = ""

  build() {
    Row() {
      Column() {
        if (this.data?.msgType == 0) {
          Text(this.data?.msg)
            .fontColor(Color.Black)
            .fontWeight(500)
            .fontSize(18)
            .padding({
              left: 14,
              right: 14,
              top: 10,
              bottom: 10
            })
            .borderRadius(4)
            .backgroundColor("#ffc08af6")
        } else if (this.data?.msgType === 2) {
          Row() {
            //Text(this.data?.msg)
            //  .fontColor(Color.Black)
             // .fontSize(18)
             // .fontWeight(500)

            Image(this.data?.img)
              .width(28)
              .width(28)
              .margin({ left: 1 })
              .objectFit(ImageFit.Auto)
          }
          .padding({
            left: 14,
            right: 14,
            top: 10,
            bottom: 10
          })
          .borderRadius(4)
          .backgroundColor("#ffc08af6")
          .onClick(this.playVoice)

        } else {
          Image(this.data?.img)
            .width(150)
            .borderRadius(4)
            .objectFit(ImageFit.Auto)
            .backgroundColor("#ffc08af6")
        }
      }
      .margin({ left: 80 })
      .alignItems(HorizontalAlign.End)
      .layoutWeight(1)

      Path()
        .commands(`M0 0 L${vp2px(10)} ${vp2px(7)} 0 ${vp2px(14)} Z`)
        .fill('rgba(192, 138, 246, 1.00)')
        .margin({
          top: 18
        })
        .strokeWidth(0)

      Image(this.userAvatar ? ('http://47.109.74.84:9999' + this.userAvatar) : this.data?.headSrc)
        .width(48)
        .height(48)
        .borderRadius(24)
        .margin({ left: 8, right: 20 })
        .objectFit(ImageFit.Cover)

    }.alignItems(VerticalAlign.Top)
  }

  playVoice = async () => {
    if (this.data?.voicePath) {
      AudioRendererManager.doPlay(this.data?.voicePath)
    }
  }

  aboutToDisappear(): void {
    AudioRendererManager.release()
  }
}


