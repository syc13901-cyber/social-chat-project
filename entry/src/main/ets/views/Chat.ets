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
