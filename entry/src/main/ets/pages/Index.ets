import router from '@ohos.router'
import { HttpRequest } from './HttpRequest'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  aboutToAppear() {
    HttpRequest.getInstance().request();
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          router.pushUrl({url: 'pages/Second'}).then(() => {

          }).catch((e) => {

          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}