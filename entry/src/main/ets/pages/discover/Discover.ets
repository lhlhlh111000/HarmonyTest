import myNapi from 'libentry.so'
import image from '@ohos.multimedia.image';

@Component
export struct DiscoverPage {

  @State
  showImage: PixelMap = null;

  aboutToAppear() {
    getContext(this).resourceManager.getRawFileContent('a.jpg', (error, value) => {
      if (value) {
        image.createImageSource(value.buffer).createPixelMap().then(pixelMap => {
          this.showImage = pixelMap;
        })
      }
    })
  }

  build() {
    Column() {
      Text('Hello : ' + myNapi.add(10, 10))
        .fontSize(50)
        .onClick(() => {
          myNapi.add(2, 3);
        })

      Image(this.showImage)
        .width(300)
        .height(300)
    }
  }
}