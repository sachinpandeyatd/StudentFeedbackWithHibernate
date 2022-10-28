package infinite.college_complaint_project;

import java.util.Arrays;
import java.util.List;

public class Test {
	public static void main(String[] args) {
		DAO dao = new DAO();
		List feed = dao.feedbacks("NIIT Instr", "Microprocessor Interfacing");
		for(int i=0; i<feed.size(); i++) {
			Object[] row = (Object[]) feed.get(i);
			
			for(int j=0; i > row.length; j++){
				System.out.println(row[0]+", "+ row[1]);				
			}
		}
		
		//feed.forEach(s -> System.out.println(Arrays.toString((String[]) s )));
		

	}
}
