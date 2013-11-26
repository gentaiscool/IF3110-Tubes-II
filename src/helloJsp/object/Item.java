package helloJsp.object;

public class Item {

	private Integer quantity;
	private Integer idItem;
	private Integer price;

	public Item(Integer quantity, Integer idItem, Integer price) {
		// TODO Auto-generated constructor stub
		this.quantity = quantity;
		this.idItem = idItem;
		this.price = price;
	}
	
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getIdItem() {
		return idItem;
	}

	public void setIdItem(Integer idItem) {
		this.idItem = idItem;
	}
	
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

}
