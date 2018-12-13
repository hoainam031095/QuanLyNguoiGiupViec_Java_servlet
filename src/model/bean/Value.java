package model.bean;

public class Value {
	private String name;
	private String name2;
	private int value;

	public Value() {
	}

	public Value(String name, int value) {
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public String getName2() {
		return name2;
	}

	public Value(String name, String name2, int value) {
		super();
		this.name = name;
		this.name2 = name2;
		this.value = value;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return name;
	}

}
