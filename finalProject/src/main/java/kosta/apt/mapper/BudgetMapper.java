package kosta.apt.mapper;

import java.util.HashMap;
import java.util.List;

import kosta.apt.domain.management.Budget;

public interface BudgetMapper {

	public int budgetInsert(Budget budget);
	public int budgetExcelInsert(Budget budget);
	/*public int budgetExcelInsert(HashMap<String, String> map1,
			HashMap<String, Integer> map2, HashMap<String, Budget> map3);*/
	public List<Budget> selectGraphBudget(String date);
	public List<Budget> selectBudgetList(String b_date);

}
