package model.object;

import java.sql.Date;

public class Book {
    // fields
	private int id;
    private int barcode;
    private String title;
    private int pageNumber;
    private int price;
    private String description;
    private String imgLink;
    private Date createdDate;
    private int bookStatusId;
    private int publisherId;
    private int authorId;
    private int languageId;
    private int typeId;
    private int batchId;
    
    // constructor
    
    // methods
	public int getBarcode() {
		return barcode;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setBarcode(int barcode) {
		this.barcode = barcode;
	}
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
	public Date getCreateDate() {
		return createdDate;
	}
	public void setCreateDate(Date createDate) {
		this.createdDate = createDate;
	}
	public int getBookStatusId() {
		return bookStatusId;
	}
	public void setBookStatusId(int bookStatusId) {
		this.bookStatusId = bookStatusId;
	}
	public int getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
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
	public int getBatchId() {
		return batchId;
	}
	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}
	
	
}
