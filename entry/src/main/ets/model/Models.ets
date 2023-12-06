export interface Response<T> {
  errorCode?: number;
  errorMsg?: string;
  data?: T;
}

export interface PageResponse<T> {
  curPage: number;
  datas: T;
  total: number;
  size: number;
}

export interface Banner {
  desc?: string;
  id: number;
  imagePath?: string;
  isVisible?: number;
  order: number;
  title?: string;
  type: number;
  url?: string;
}

export interface Article {
  link: string,
  title: string,
}