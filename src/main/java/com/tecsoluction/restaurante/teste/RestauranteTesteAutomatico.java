//package com.tecsoluction.restaurante.teste;
//
//import static org.junit.Assert.assertNotNull;
//import static org.junit.Assert.assertThat;
//
//import org.hamcrest.Matchers;
//import org.junit.Test;
//import org.openqa.selenium.By;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.support.ui.Select;
//
//public class RestauranteTesteAutomatico {
//	
//	
//	
//	
//	
//	@Test
//	public void inserirCategoriaFilha() {
//		
//		System.setProperty("webdriver.chrome.driver","C:\\chromedriver_win32\\chromedriver.exe");
//		
//		WebDriver driver = new ChromeDriver();
//
//		driver.get("http://localhost:8094/restaurante/categoria/cadastro");
//		
//
//		WebElement inputcategoriaFILHA = driver.findElement(By.name("nome"));
//		inputcategoriaFILHA.sendKeys("TESTE");
//		
//		Select selectCATPAI = new Select(driver.findElement(By.name("catpai")));
////		selectCATPAI.deselectByVisibleText("");
//		selectCATPAI.selectByVisibleText("PAI");
////		("67df9c99-425d-43dc-8414-bdcc6ae192d6");
//		
//		WebElement buttonInserir = driver.findElement(By.cssSelector("input[type='submit'"));
//		 buttonInserir.click();
//		
//		// verifica se ha resultados
//		 String codigoPagina = driver.getPageSource();
//		assertThat(codigoPagina, Matchers.containsString("Sucesso!"));
//		assertNotNull(driver.findElement(By.cssSelector("h4.alert-heading")));
//		
//		driver.quit();	
//		
//	}
//	
//	
//
//	
//	@Test
//	public void inserirCategoriaPai() {
//		
//		System.setProperty("webdriver.chrome.driver","C:\\chromedriver_win32\\chromedriver.exe");
//		
//		WebDriver driver = new ChromeDriver();
//
//		driver.get("http://localhost:8094/restaurante/categoria/cadastro");
//		
//
//		WebElement inputcategorianomePAI = driver.findElement(By.name("nome"));
//		inputcategorianomePAI.sendKeys("PAIt");
//		
//		WebElement buttonInserir = driver.findElement(By.cssSelector("input[type='submit'"));
//		buttonInserir.click();
//		
//		// verifica se ha resultados
//		String codigoPagina = driver.getPageSource();
//		assertThat(codigoPagina, Matchers.containsString("Sucesso!"));
//		assertNotNull(driver.findElement(By.cssSelector("h4.alert-heading")));
//			
//		driver.quit();	
//		
//	}
//	
//	
//	@Test
//	public void lostPassword() {
//		
//		
//		System.setProperty("webdriver.chrome.driver","C:\\chromedriver_win32\\chromedriver.exe");
//		
//		WebDriver driver = new ChromeDriver();
//
//		driver.get("http://localhost:8094/restaurante/");
//		
//		
//		// clica no botao Lost Password
//		WebElement buttonlostPassword =  driver.findElement(By.name("lost"));
//		buttonlostPassword.click();
//		
//		WebElement inputmail = driver.findElement(By.name("emailrecovery"));
//		inputmail.sendKeys("WINDSOR_MELO@HOTMAIL.COM");
//		
//		
//		WebElement buttonRecovery = driver.findElement(By.name("recovery"));
//		buttonRecovery.click();
//		
////		// verifica se ha resultados
////		String codigoPagina = driver.getPageSource();
////		assertThat(codigoPagina, Matchers.containsString("Bem Vindo"));
////		assertNotNull(driver.findElement(By.cssSelector("div.quick-actions_homepage")));
//		
//		driver.quit();
//		
//		
//		
//	}
//	
//	
//	
//	@Test
//	public void acessarAplicacao() {
//		
//		
//		System.setProperty("webdriver.chrome.driver","C:\\chromedriver_win32\\chromedriver.exe");
//		
//		WebDriver driver = new ChromeDriver();
//
//		driver.get("http://localhost:8094/restaurante/");
//		
//
//		WebElement inputusername = driver.findElement(By.name("username"));
//		inputusername.sendKeys("DINHO");
//
//		WebElement inputsenha = driver.findElement(By.name("senha"));
//		inputsenha.sendKeys("123456");
//		
//		// clica no botao login
//		WebElement buttonlogin = driver.findElement(By.cssSelector("button[type='submit'"));
//		buttonlogin.click();
//		
//		// verifica se ha resultados
//		String codigoPagina = driver.getPageSource();
//		assertThat(codigoPagina, Matchers.containsString("Bem - Vindo"));
//		assertNotNull(driver.findElement(By.cssSelector("div.quick-actions_homepage")));
//		
//		driver.quit();
//		
//		
//		
//	}
//	
//
//
//}
