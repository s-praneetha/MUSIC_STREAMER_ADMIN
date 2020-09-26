package in.entity;

public class Performer {
	private String performer_id = null;
	private String performer_name = null;
	private String performer_description = null;
 
	
	public String getPerformer_name() {
		return performer_name;
	}
	public void setPerformer_name(String performer_name) {
		this.performer_name = performer_name;
	}
	public String getPerformer_description() {
		return performer_description;
	}
	public void setPerformer_description(String performer_description) {
		this.performer_description = performer_description;
	}
	
	
	public String getPerformer_id() {
		return performer_id;
	}
	public void setPerformer_id(String performer_id) {
		this.performer_id = performer_id;
	}
	@Override
	public String toString() {
		return "Performer [performer_id=" + performer_id + ", performer_name=" + performer_name
				+ ", performer_description=" + performer_description + "]";
	}
	
	
	
	
}
