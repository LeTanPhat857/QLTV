package model.object;

import java.sql.Date;

public class Book {
    // fields
    private int bookCode;
    private String title;
    private int pageNumber;
    private boolean isBorrow;
    private double price;
    private boolean isDelete;
    private Date createDate;
    private int authorId;
    private int languageId;
    private int typeId;
    private int inputId;

    // constructor

    // methods
    public int getBookCode() { return bookCode; }

    public void setBookCode(int bookCode) { this.bookCode = bookCode; }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public boolean isBorrow() {
        return isBorrow;
    }

    public void setBorrow(boolean borrow) {
        isBorrow = borrow;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int author) {
        this.authorId = author;
    }

    public int getLanguageId() {
        return languageId;
    }

    public void setLanguageId(int languageId) {
        this.languageId = languageId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getInputId() {
        return inputId;
    }

    public void setInputId(int inputId) {
        this.inputId = inputId;
    }
}
