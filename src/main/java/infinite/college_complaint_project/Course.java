package infinite.college_complaint_project;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="CourseList")

public class Course {
	@Id
	@Column(name="courseno")
	private String courseno;
	
	@Column(name="duration")
	private int duration;
	
	@Column(name="startDate")
	private Date startDate;
	
	@Column(name="endDate")
	private Date endDate;
	
	@Column(name="HOD")
	private String hod;

	public String getCourseno() {
		return courseno;
	}

	public void setCourseno(String courseno) {
		this.courseno = courseno;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getHod() {
		return hod;
	}

	public void setHod(String hod) {
		this.hod = hod;
	}
}