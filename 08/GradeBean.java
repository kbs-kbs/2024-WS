package aa;

public class GradeBean {

	private String name;
	private int point;
	private String grade;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
		
	}
	public String getGrade() {
		if (point > 89) {
			return "A";
		} else if (point > 79) {
			return "B";
		} else if (point > 59) {
			return "C";
		} else {
			return "D";
		}
	}
	
}
