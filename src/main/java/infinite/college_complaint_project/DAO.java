package infinite.college_complaint_project;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
}
