package in.entity;

import java.io.FileInputStream;

public class AddTrack {
	
	private String track_id;
	private String track_performer;
	private String track_album;
	private String track_no;
	private FileInputStream track_file;
	private String track_name;
	private String track_duration;
	private String track_description;
	
	
	
	public FileInputStream getTrack_file() {
		return track_file;
	}
	public void setTrack_file(FileInputStream track_file) {
		this.track_file = track_file;
	}
	public String getTrack_id() {
		return track_id;
	}
	public void setTrack_id(String track_id) {
		this.track_id = track_id;
	}
	public String getTrack_performer() {
		return track_performer;
	}
	public void setTrack_performer(String track_performer) {
		this.track_performer = track_performer;
	}
	public String getTrack_album() {
		return track_album;
	}
	public void setTrack_album(String track_album) {
		this.track_album = track_album;
	}
	public String getTrack_no() {
		return track_no;
	}
	public void setTrack_no(String track_no) {
		this.track_no = track_no;
	}
	public String getTrack_name() {
		return track_name;
	}
	public void setTrack_name(String track_name) {
		this.track_name = track_name;
	}
	public String getTrack_duration() {
		return track_duration;
	}
	public void setTrack_duration(String track_duration) {
		this.track_duration = track_duration;
	}
	public String getTrack_description() {
		return track_description;
	}
	public void setTrack_description(String track_description) {
		this.track_description = track_description;
	}
	
	
	@Override
	public String toString() {
		return "AddTrack [track_id=" + track_id + ", track_performer=" + track_performer + ", track_album="
				+ track_album + ", track_no=" + track_no + ", track_file=" + track_file + ", track_name=" + track_name
				+ ", track_duration=" + track_duration + ", track_description=" + track_description + "]";
	}
	
	
	
	
	
	
}
