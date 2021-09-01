package model.object;

import java.sql.Date;

public class Book_ver2 {
	private int id;
	private int barcode;
	private String title;
	private int pageNumber;
	private int price;
	private String description;
	private String imgLink;
	private Date createdDate;
	private String status;
	private String author;
	private String language;
	private String type;
	private String publisher;
	private Date dateOfBatch;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBarcode() {
		return barcode;
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
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getDateOfBatch() {
		return dateOfBatch;
	}
	public void setDateOfBatch(Date dateOfBatch) {
		this.dateOfBatch = dateOfBatch;
	}
	@Override
	public String toString() {
		return "Book [id:" + id + ", barcode=" + barcode + ", title=" + title + ", pageNumber=" + pageNumber
				+ ", price=" + price + ", description=" + description + ", imgLink=" + imgLink + ", createdDate="
				+ createdDate + ", status=" + status + ", author=" + author + ", language=" + language + ", type="
				+ type + ", publisher=" + publisher + ", dateOfBatch=" + dateOfBatch + "]\n";
	}
}
