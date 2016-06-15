package kosta.apt.domain.Message;

public class MessageCriteria {

  private int page=1;
  private int perPageNum=2;

  public MessageCriteria() {
    this.page = 1;
    this.perPageNum = 2;
  }

  public void setPage(int page) {

    if (page <= 0) {
      this.page = page;
      return;
    }

    this.page = page;
  }

  public void setPerPageNum(int perPageNum) {

    if (perPageNum <= 0 || perPageNum > 100) {
      this.perPageNum = 2;
      return;
    }

    this.perPageNum = perPageNum;
  }

  public int getPage() {
    return page;
  }

  // method for MyBatis SQL Mapper -
  public int getPageStart() { //시작 데이터번호 즉, 한페이지당 2개씩보여줄꺼면 2페이지에는 3,4 3페이지에서는 4,5데이터번호를 가져와야대

    return (this.page - 1) * perPageNum;
  }

  // method for MyBatis SQL Mapper
  public int getPerPageNum() {

    return this.perPageNum;
  }

  @Override
  public String toString() {
    return "Criteria [page=" + page + ", "
        + "perPageNum=" + perPageNum + "]";
  }
}
