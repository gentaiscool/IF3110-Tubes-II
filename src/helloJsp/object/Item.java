package helloJsp.object;

public class Item {

	private Integer quantity;
	private Integer idItem;
	
	public Item(Integer quantity, Integer idItem) {
		// TODO Auto-generated constructor stub
		this.quantity = quantity;
		this.idItem = idItem;
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

}
