import myNapi from 'libentry.so'

@Component
export struct DiscoverPage {

  build() {
    Column() {
      Text('Hello : ' + myNapi.add(10, 10))
        .fontSize(50)
        .onClick(() => {
          myNapi.add(2, 3);
        })
    }
  }
}