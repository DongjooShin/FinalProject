package kosta.apt.persistence;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kosta.apt.domain.calendar.Calendar;
import kosta.apt.domain.member.Member;
import kosta.apt.mapper.CalMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDao {
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	
	public void insertCal(Calendar calendar) {
		
		
		sqlSession.getMapper(CalMapper.class).insertCal(calendar);
		
		if(sqlSession !=null){
			System.out.println("calnedar add 성공");
		}else{
			System.out.println("실패애애애애");
		}
	}

	public void deleteCal(Calendar calendar) {
		System.out.println("delete calendar 성공");
		System.out.println("calendar Dao=>"+calendar.toString());
		sqlSession.getMapper(CalMapper.class).calendarDel(calendar);
		
	}

	public List<Calendar> listCalendar(Member m) {
		int aptGroupNum=m.getApt_APTGNo();
		System.out.println("list calendar 성공");
		return sqlSession.getMapper(CalMapper.class).listCalendar(aptGroupNum);
	}

	public List<Calendar> calendarDday1(Calendar calendar) {
		
		return sqlSession.getMapper(CalMapper.class).calendarDday1(calendar);
	}

	public List<Calendar> calendarDday(Calendar calendar) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(CalMapper.class).calendarDday(calendar);
	}

	public List<Calendar> calendarDday2(Calendar calendar) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(CalMapper.class).calendarDday2(calendar);
	}

	public List<Calendar> calendarDday3(Calendar calendar) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(CalMapper.class).calendarDday3(calendar);
	}

	
	
}
