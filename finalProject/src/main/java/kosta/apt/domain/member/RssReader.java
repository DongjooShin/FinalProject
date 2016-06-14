package kosta.apt.domain.member;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;

public class RssReader {
	
	List<Map<String, String>> newsList = new ArrayList<Map<String, String>>();
	public List<Map<String, String>> getSynFeed(int newsNum) throws Exception {
		
		String newsDomain[] = new String[4];
		newsDomain[0] = "http://news.mk.co.kr/rss/land.xml";//매일경제
		newsDomain[1] = "http://biz.chosun.com/site/data/rss/estate.xml";//조선비즈
		newsDomain[2]  = "http://rss.edaily.co.kr/realestate_news.xml";//이데일리
		newsDomain[3]  = "http://biz.heraldm.com/rss/010300000000.xml ";//헤럴드
	
		URL feedUrl = new URL(newsDomain[newsNum]);
		SyndFeedInput input = new SyndFeedInput();
		SyndFeed syndFeed = input.build(new XmlReader(feedUrl));
		List<SyndEntry> entries = syndFeed.getEntries();
		SyndEntry entry = null;
		


		/* 발행정보 */
		for (int i = 0, j = entries.size(); i < j; i++) {
			entry = entries.get(i);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("title", entry.getTitle());
			map.put("url", entry.getUri());
			map.put("description", entry.getDescription().getValue());
			newsList.add(map);

		}
	return newsList;
	}

}
