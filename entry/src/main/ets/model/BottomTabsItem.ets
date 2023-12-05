export interface BottomTabItem {
  icon: Resource;
  text: Resource;
}

export const BottomTabsList: Array<BottomTabItem> = [
  {
    icon: $r('app.media.ic_home'),
    text: $r('app.string.bottom_text_home')
  },
  {
    icon: $r('app.media.ic_discover'),
    text: $r('app.string.bottom_text_discover')
  },
  {
    icon: $r('app.media.ic_people'),
    text: $r('app.string.bottom_text_mine')
  }
]