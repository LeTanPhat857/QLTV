package model.object;

public class UserStatus {
	// fields
	private int id;
	private String status;
	private String description;

	// constructor

	// methods
	public int getId() {
		return id;
	}

	public void setId(int userStatusId) {
		this.id = userStatusId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
