export class ADataSource<T> implements IDataSource  {

  private list: T[] = [];
  private listener: DataChangeListener;

  constructor(list: T[]) {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): T {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener;
  }

  unregisterDataChangeListener() {
  }
}