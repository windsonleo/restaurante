//package com.tecsoluction.restaurante;
//
//import java.io.IOException;
//
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
//import javax.persistence.PersistenceUnit;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//
//import org.springframework.core.annotation.Order;
//import org.springframework.stereotype.Component;
//
//@Component
//@Order(0)
//public class JpaFilterLazzy  implements Filter {
//	
//
//
//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
//			throws IOException, ServletException {
//		
//		EntityManager entityManager = emf.createEntityManager(); 
//		
//		try{ 
//			
//			entityManager.getTransaction().begin();
//		// realiza as açoes do sistema filterChain.doFilter(request, response);
//		entityManager.getTransaction().commit(); 
//		
//		} catch (Exception ex){
//			
//			if(entityManager != null && entityManager.getTransaction().isActive()){ 
//				entityManager.getTransaction().rollback(); 
//				} 
//			
//			} finally { 
//				if(entityManager != null && entityManager.isOpen()){ 
//			
//					entityManager.close();
//			
//		}
//				
//		}
//		
//	}
//
//	@Override
//	public void init(FilterConfig arg0) throws ServletException {
//		// TODO Auto-generated method stub
//		
//	}
//
//}
