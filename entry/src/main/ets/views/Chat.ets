import router from '@ohos.router'
import ListChatItem, { ChatItemData } from '../component/ListChatItem'
import WechatToolbar from '../component/WechatToolbar'

@Preview
@Component
export struct Chat {
  @State chatList: ChatItemData[] = [
    {
      headSrc: $r("app.media.ic_user_head2"),
      nickname: "王姐",
      content: "昨天让你整理的季度报表初稿弄好了吗？",
      time: "17:21"
    },
    {
      headSrc: $r("app.media.ic_user_head3"),
      nickname: "张工",
      content: "你那边能不能协调一下备用的？",
      time: "15:38"
    },
    { headSrc: $r("app.media.ic_user_head4"),
      nickname: "刘经理",
      content: "明天上午 10 点的项目评审会",
      time: "14:12"
    },
    { headSrc: $r("app.media.ic_user_head5"),
      nickname: "HR小孙",
      content: "这个岗位还需要招两个人",
      time: "12:08"
    },
    { headSrc: $r("app.media.ic_user_head6"),
      nickname: "客户小潘",
      content: "这是我们公司的报价，希望您能考虑下",
      time: "昨天" },
    { headSrc: $r("app.media.ic_user_head7"),
      nickname: "小周",
      content: "刚才客户反馈我们上周交付的系统有个功能 bug",
      time: "周一" }
  ]

  build() {
    Column() {
      WechatToolbar({ title: "消息(5)" })
      // 新增：跳转到Agent界面的按钮
      Button("进入智能体界面")
        .width('90%')
        .height(50)
        .margin({ top: 20, bottom: 20, left: 20, right: 20 })
        .backgroundColor('#ffc08af6')
        .fontColor('#fff')
        .fontSize(20)
        .borderRadius(8)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/AgentPage',
            params: {
              name: '示例智能体',
              url: 'https://www.coze.cn/store/agent/7528992818954616867?from=bots_card&bid=6gvf2tlog6000' // 可替换为实际智能体url
            }
          })
        })
      List() {
        ForEach(this.chatList, (item: ChatItemData, index: number) => {
          ListItem() {
            ListChatItem({ data: item })
          }
          .onClick(() => {
            router.pushUrl({ url: 'views/ChatPage',
              params: {name:item.nickname}
            })
          })
        })
        ListItem() {
          Divider().color('#0000').strokeWidth(0)
        }
      }
      .divider({ strokeWidth: 0.8, color: '#f0f0f0', startMargin: 90, endMargin: 0 }) // 每行之间的分界线
      .backgroundColor(Color.White)
      .width("100%")
      .height("100%")


    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f0f0f0")
  }
}
