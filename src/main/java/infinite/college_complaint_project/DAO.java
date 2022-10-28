package infinite.college_complaint_project;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;


public class DAO {
	SessionFactory sessionFactory;
	
	public String addSubject(Subject subject) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		session.save(subject);
		transaction.commit();
		session.close();
		
		return "Subject Added.";
	}
	
	public String generateCourseId() {
		sessionFactory=SessionHelper.getConnection();
		Session session;
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Course.class);
		List<Course>courselist=cr.list();
		session.close();
		
		if (courselist.size()==0) {
			return "C001";
		} else {
		String courseIds=courselist.get(courselist.size()-1).getCourseno();
		int ids = Integer.parseInt(courseIds.substring(1));
		ids++;
		String rid=String.format("C%03d",++ids);
		return rid;
		}
	}
	
	public String Addcourse(Course course) {
		String courseID=generateCourseId();
		course.setCourseno(courseID);
		if (sessionFactory==null) {
			sessionFactory=SessionHelper.getConnection();
		}
		Session session;
		session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		session.save(course);
		trans.commit();
		session.close();
		return "***----Add Course----***";
		
	}
	
	public Date convertDate(java.util.Date dt) {
		java.sql.Date sqlDate=new java.sql.Date(dt.getTime());
		return sqlDate;
	}
	
	public List<String> instructors() {
		sessionFactory=SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(Subject.class);
		criteria.setProjection(Projections.distinct(Projections.property("instructor")));
		
		List<String> courselist = criteria.list();
		
		return courselist;
	}
	
	public List<String> subjects(String instructor) {
		sessionFactory=SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(Subject.class).add(Restrictions.eq("instructor", instructor)).setProjection(Projections.property("subject"));
		List<String> subjectList = criteria.list();
		return subjectList;
	}
	
	public String addFeedback(Feedback feedback) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		session.save(feedback);
		transaction.commit();
		session.close();
		
		return "Feedback Added.";
	}
	
	public List feedbacks(String instructor, String subject) {
		sessionFactory=SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		
		Query query = session.createQuery("SELECT fbValue, count(*) from Feedback where instructor = :instructor and subject = :subject group by fbValue").setParameter("instructor", instructor).setParameter("subject", subject);
		List<Object> feedbacks = query.list();
		
		return feedbacks;
	}
}
