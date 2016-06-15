package kosta.apt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;

import kosta.apt.domain.management.Budget;
import kosta.apt.persistence.BudgetDao;

@Service
public class BudgetService {

	private BudgetDao dao;

	@Autowired
	public void setDao(BudgetDao dao) {
		this.dao = dao;
	}

	public void budgetInsert(Budget budget) {
		dao.budgetInsert(budget);
	}

	public void budgetExcelInsert(MultipartRequest multi) {
		Budget budget = new Budget();
		
		if(multi.getFilesystemName("b_fileName") == null){
			budget.setB_clean(Integer.parseInt(multi.getParameter("b_clean")));
			budget.setB_general(Integer.parseInt(multi.getParameter("b_general")));
			budget.setB_maintain(Integer.parseInt(multi.getParameter("b_maintain")));
			budget.setB_liftMaintain(Integer.parseInt(multi.getParameter("b_liftMaintain")));
			budget.setB_security(Integer.parseInt(multi.getParameter("b_security")));
			budget.setB_foodWaste(Integer.parseInt(multi.getParameter("b_foodWaste")));
			budget.setB_fireInsurance(Integer.parseInt(multi.getParameter("b_fireInsurance")));
			budget.setB_commission(Integer.parseInt(multi.getParameter("b_commission")));
			budget.setB_meeting(Integer.parseInt(multi.getParameter("b_meeting")));
			budget.setB_publicElectric(Integer.parseInt(multi.getParameter("b_publicElectric")));
			budget.setB_liftElectric(Integer.parseInt(multi.getParameter("b_liftElectric")));
			budget.setB_TVFee(Integer.parseInt(multi.getParameter("b_TVFee")));
			budget.setB_disinfection(Integer.parseInt(multi.getParameter("b_disinfection")));
			budget.setB_appropriation(Integer.parseInt(multi.getParameter("b_appropriation")));
		}
		
		budget.setB_date(multi.getParameter("b_date"));
		budget.setApt_APTGNo(1);
		
		//파일 업로드
		if(multi.getFilesystemName("b_fileName") != null){
			String f_name = multi.getFilesystemName("b_fileName"); // 파일이름을 구해줌
			budget.setB_fileName(f_name);
		}else{
			budget.setB_fileName("");
		}
		
		dao.budgetInsert(budget);
		
	}

	public void budgetExcelInsert(Budget budget) {
		dao.budgetExcelInsert(budget);
	}

	public List<Budget> selectBudgetList() {
		return dao.selectBudgetList();
	}
	
	
}
