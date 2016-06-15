package kosta.apt.persistence;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.apt.domain.management.Budget;
import kosta.apt.mapper.BudgetMapper;

@Repository
public class BudgetDao {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void budgetInsert(Budget budget) {
		sqlSession.getMapper(BudgetMapper.class).budgetInsert(budget);
	}

	public void budgetExcelInsert(Budget budget) {
		sqlSession.getMapper(BudgetMapper.class).budgetExcelInsert(budget);
	}

	public List<Budget> selectBudgetList() {
		List<Budget> list = null;

		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		String b_date = "";
		b_date += calendar.get(Calendar.YEAR);
		System.out.println(b_date);

		return sqlSession.getMapper(BudgetMapper.class).selectBudgetList(b_date);
	}
	
}
