import { CommonTitle } from "./UIComponent";

interface MessageItem {
    id: number;
    avatar: string;
    name: string;
    content: string;
    time: string;
    unread: number;
}
@Preview
@Component
export struct Chat {
    private messageList: MessageItem[] = [
        {
            id: 1,
            avatar: '/resources/base/media/chat_header_icon.png',
            name: '陈小姐',
            content: '好的，那我们下午3点见面讨论项目细节',
            time: '14:30',
            unread: 3
        },
        {
            id: 2,
            avatar: '/resources/base/media/my_header.png',
            name: '王总监',
            content: '项目报告我已经审核完毕，请查收',
            time: '13:45',
            unread: 0
        },
        {
            id: 3,
            avatar: '/resources/base/media/dynamic_header1.png',
            name: '产品开发群',
            content: '张工：新功能原型已经更新到最新版本',
            time: '12:20',
            unread: 12
        },
        {
            id: 4,
            avatar: '/resources/base/media/chat1.png',
            name: '刘经理',
            content: '周五的会议记得准备一下演示文稿',
            time: '昨天',
            unread: 0
        },
        {
            id: 5,
            avatar: '/resources/base/media/avg.png',
            name: '赵总',
            content: '客户反馈已经整理完毕，请过目',
            time: '昨天',
            unread: 0
        },
        {
            id: 6,
            avatar: '/resources/base/media/welcome.png',
            name: '市场部工作群',
            content: '李总：下周一例会改到下午2点',
            time: '周一',
            unread: 0
        }
    ];

    build() {
        Column() {
            CommonTitle({ title: '消息中心' })
            List() {
                ForEach(this.messageList, (item: MessageItem) => {
                    ListItem() {
                        Row() {
                            Image(item.avatar)
                                .width(48).height(48)
                                .borderRadius(24)
                            Column() {
                                Row() {
                                    Text(item.name).fontWeight(600).fontSize(18)
                                    if (item.unread > 0) {
                                        Text(item.unread.toString())
                                            .fontColor('#fff')
                                            .backgroundColor('#F44336')
                                            .borderRadius(10)
                                            .fontSize(12)
                                            .padding({
                                                left: 6,
                                                right: 6,
                                                top: 2,
                                                bottom: 2
                                            })
                                            .margin({ left: 6 })
                                    }

                                    Text(item.time).fontSize(14).fontColor('#9CA3AF')
                                }.width('100%')

                                Text(item.content)
                                    .fontSize(15)
                                    .fontColor('#6B7280')
                                    .margin({ top: 4 }).width('100%')
                            }.margin({ left: 12 })
                        }
                        .padding(12)
                        .backgroundColor('#fff')
                        .width('100%')
                    }.width('100%')
                }, (item: MessageItem) => item.id + "")
            }
        }
        .backgroundColor('#F5F6FA')
        .width('100%')
        .height('100%')
    }
}