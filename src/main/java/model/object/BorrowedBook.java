package model.object;

import java.sql.Timestamp;

public class BorrowedBook {
	// fields
	private Timestamp date;
	private int barcode;
	private String title;
	private String author;
	private String publisher;
	private int price;
	
	// constructor
	
	// methods
	public Timestamp getDate() {
		return this.date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
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
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
