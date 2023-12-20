package com.pichill.post.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.pichill.post.entity.Post;
import com.pichill.util.HibernateUtil;

public class PostDAOImpl implements PostDAO {

	private static final int PAGE_MAX_RESULT = 4;
	private SessionFactory factory;

	public PostDAOImpl() {
		factory = com.pichill.util.HibernateUtil.getSessionFactory();
	}

	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
	// 以避免請求執行緒共用了同個 Session
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(Post entity) {
//		SessionFactory factory2 = HibernateUtil.getSessionFactory();
//		Session session = factory2.openSession();
//		Transaction tx = session.beginTransaction();
//		 回傳給 service 剛新增成功的自增主鍵值
//		entity.setPostTime(new java.sql.Timestamp(System.currentTimeMillis()));
//		session.save(entity);
//		tx.commit();
//		return 1;
		return (Integer) getSession().save(entity);
	}

	@Override
	public int update(Post entity) {
		try {
//			SessionFactory factory2 = HibernateUtil.getSessionFactory();
//			Session session = factory2.openSession();
//			Transaction tx = session.beginTransaction();
			getSession().update(entity);
//			tx.commit();
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer postID) {
		Post post = getSession().get(Post.class, postID);
		if (post != null) {
			getSession().delete(post);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
	public Post getByPostID(Integer postID) {
		try {
			getSession().clear();
			return getSession().get(Post.class, postID);
		} catch (Exception e) {
			e.printStackTrace(); // 或使用日誌庫記錄異常
			return null;
		}
	}

	@Override
	public List<Post> getByTitle(String postTitle) {
		return getSession().createQuery("from Post WHERE postTitle like :postTitle", Post.class)
				.setParameter("postTitle", "%" + postTitle + "%").list();
	}

	@Override
	public List<Post> getByType(Integer postType) {
		return getSession().createQuery("from Post WHERE postType = :postType", Post.class)
				.setParameter("postType", postType).list();
	}

	@Override
	public List<Post> getBygUserID(Integer gUserID) {
		return getSession().createQuery("from Post WHERE gUserID = :gUserID", Post.class)
				.setParameter("gUserID", gUserID).list();
	}

	@Override
	public List<Post> getByoUserID(Integer oUserID) {
		return getSession().createQuery("from Post WHERE oUserID = :oUserID", Post.class)
				.setParameter("oUserID", oUserID).list();
	}

	@Override
	public List<Post> getByCommentCnt() {
		return getSession().createQuery("from Post Order by commentCnt desc", Post.class).list();
	}

//	@Override
//	public List<Post> getByCommentCnt() {
//	Date currentDate = new Date();
//    Calendar calendar = Calendar.getInstance();
//    calendar.setTime(currentDate);
//    calendar.add(Calendar.DAY_OF_MONTH, -3);
//    Date threeDaysAgo = calendar.getTime();
//return getSession().createQuery("from Post WHERE postTime >= :threeDaysAgo ORDER BY commentCnt DESC",Post.class)
//		.setParameter("threeDaysAgo", threeDaysAgo)
//		.list();
//	}
	@Override
	public List<Post> getAll() {
		return getSession().createQuery("from Post", Post.class).list();
	}

	@Override
	public List<Post> getAll(int currentPage) {
		int first = (currentPage - 1) * PAGE_MAX_RESULT;
		List<Post> posts;

		if (currentPage == 1 || currentPage == 2) {
			posts = getSession().createQuery("from Post where postType in (0, 1) order by postID desc", Post.class)
					.setFirstResult(first).setMaxResults(PAGE_MAX_RESULT).list();
		} else {
			posts = getSession().createQuery("from Post where postType = 2 order by postID desc", Post.class).list();
		}

		return posts;
	}

	@Override
	public long getTotal() {
		return getSession().createQuery("select count(*) from Post", Long.class).uniqueResult();
	}

	@Override
	public int updateLike(Integer postID, Integer likeCnt) {
		  return getSession()
		            .createQuery("UPDATE Post SET likeCnt = :likeCnt WHERE postID = :postID")
		            .setParameter("likeCnt", likeCnt)
		            .setParameter("postID", postID)
		            .executeUpdate();
	}

	@Override
	public int updateComment(Integer postID, Integer commentCnt) {
		  return getSession()
		            .createQuery("UPDATE Post SET commentCnt = :commentCnt WHERE postID = :postID")
		            .setParameter("commentCnt",commentCnt)
		            .setParameter("postID", postID)
		            .executeUpdate();
	}
}

//	@Override
//	public List<Post> getByCompositeQuery(Map<String, String> map) {
//		if (map.size() == 0)
//			return getAll();
//
//		CriteriaBuilder builder = getSession().getCriteriaBuilder();
//		CriteriaQuery<Post> criteria = builder.createQuery(Post.class);
//		Root<Post> root = criteria.from(Post.class);
//
//		List<Predicate> predicates = new ArrayList<>();
//
//		for (Map.Entry<String, String> row : map.entrySet()) {
//			if ("postTitle".equals(row.getKey())) {
//			predicates.add(builder.like(root.get("postTitle"), "%" + row.getValue() + "%"));
//		}
//			if ("gUserID".equals(row.getKey())) {
//				predicates.add(builder.like(root.get("gUserID"), "%" + row.getValue() + "%"));
//			}
//		}
//		criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
//		criteria.orderBy(builder.desc(root.get("postID")));
//		TypedQuery<Post> query = getSession().createQuery(criteria);
//
//		return query.getResultList();
//	}
//}

//if ("postTitle".equals(row.getKey())) {
//	predicates.add(builder.like(root.get("postTitle"), "%" + row.getValue() + "%"));
//}
//
//if ("postType".equals(row.getKey())) {
//	predicates.add(builder.like(root.get("postType"), "%" + row.getValue() + "%"));
//}
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//public class PostDAOImpl implements PostDAO{
//	private static final String INSERT_STMT = "INSERT INTO post(gUserID,oUserID, postTitle, postContent, postType,postTime, likeCnt) VALUES (?, ?, ?, ?, ?, ?, ?)";
//	private static final String UPDATE_STMT = "UPDATE post SET gUserID = ?, oUserID = ?, postTitle = ?, postContent = ?, postType = ?, postTime = ?,likeCnt = ? WHERE postID = ?";
//	private static final String DELETE_STMT = "DELETE FROM post WHERE postID = ?";
//	private static final String FIND_BY_PK = "SELECT * FROM post WHERE postID = ?";
//	private static final String GET_ALL = "SELECT * FROM post";
//	
//	static {
//		try {
//			Class.forName(Util.DRIVER);
//		}catch(ClassNotFoundException ce) {
//			ce.printStackTrace();
//		}
//	}
//	
//	
//	@Override
//	public void add(Post post) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
//			pstmt = con.prepareStatement(INSERT_STMT);
//
//			pstmt.setInt(1, post.getgUserID());
//			pstmt.setInt(2, post.getoUserID());
//			pstmt.setString(3, post.getPostTitle());
//			pstmt.setString(4, post.getPostContent());
//			pstmt.setInt(5, post.getPostType());
//			pstmt.setTimestamp(6, post.getPostTime());
//			pstmt.setInt(7, post.getLikeCnt());
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			se.printStackTrace();
//			// Clean up JDBC resources
//		} finally {
//			Util.closeResources(con, pstmt, null);
//		}
//	}
//
//	@Override
//	public void update(Post post) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
//			pstmt = con.prepareStatement(UPDATE_STMT);
//	
//			pstmt.setInt(1, post.getgUserID());
//			pstmt.setInt(2, post.getoUserID());
//			pstmt.setString(3, post.getPostTitle());
//			pstmt.setString(4, post.getPostContent());
//			pstmt.setInt(5, post.getPostType());
//			pstmt.setTimestamp(6, post.getPostTime());
//			pstmt.setInt(7, post.getLikeCnt());
//			pstmt.setInt(8, post.getPostID());
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			se.printStackTrace();
//			// Clean up JDBC resources
//		} finally {
//			Util.closeResources(con, pstmt, null);
//		}
//	}
//	@Override
//	public void delete(int postID) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			con = DriverManager.getConnection(Util.URL, Util.USER, Util.PASSWORD);
//			pstmt = con.prepareStatement(DELETE_STMT);
//
//			pstmt.setInt(1, postID);
//			
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (SQLException se) {
//			se.printStackTrace();
//			// Clean up JDBC resources
//		} finally {
//			Util.closeResources(con, pstmt, null);
//		}
//	}
//		
//	@Override
//	public Post findByPK(Integer PostID) {
//		Post post = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			
//			con = DriverManager.getConnection(Util.URL,Util.USER,Util.PASSWORD);
//			pstmt = con.prepareStatement(FIND_BY_PK);
//			pstmt.setInt(1,PostID);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				post = new Post();
//				post.setPostID(rs.getInt("postID"));	
//				post.setgUserID(rs.getInt("gUserID"));		
//				post.setoUserID(rs.getInt("oUserID"));		
//				post.setPostTitle(rs.getString("postTitle"));		
//				post.setPostContent(rs.getString("postContent"));		
//				post.setPostType(rs.getInt("postType"));		
//				post.setPostTime(rs.getTimestamp("postTime"));		
//				post.setLikeCnt(rs.getInt("likeCnt"));		
//			}
//		}catch(SQLException se) {
//			se.printStackTrace();
//		}finally {
//			Util.closeResources(con, pstmt, rs);
//		}
//		return post;
//	}
//	@Override
//	public List<Post> getAll() {
//		List<Post>postList = new ArrayList<>();
//		Post post = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			
//			con = DriverManager.getConnection(Util.URL,Util.USER,Util.PASSWORD);
//			pstmt = con.prepareStatement(GET_ALL);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				post = new Post();
//				post.setPostID(rs.getInt("postID"));	
//				post.setgUserID(rs.getInt("gUserID"));		
//				post.setoUserID(rs.getInt("oUserID"));		
//				post.setPostTitle(rs.getString("postTitle"));		
//				post.setPostContent(rs.getString("postContent"));		
//				post.setPostType(rs.getInt("postType"));		
//				post.setPostTime(rs.getTimestamp("postTime"));		
//				post.setLikeCnt(rs.getInt("likeCnt"));
//				postList.add(post);
//			}
//		}catch(SQLException se) {
//			se.printStackTrace();
//		}finally {
//			Util.closeResources(con, pstmt, rs);
//		}
//		return postList;
//	}
//	
//}
//
//
