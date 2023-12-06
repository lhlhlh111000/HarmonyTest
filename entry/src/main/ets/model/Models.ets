export interface Result<T> {

  errorCode?: number;

  errorMsg?: string;

  data?: T;
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