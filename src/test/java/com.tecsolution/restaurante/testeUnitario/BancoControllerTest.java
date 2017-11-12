package com.tecsolution.restaurante.testeUnitario;

import com.tecsoluction.restaurante.service.impl.BancoServicoImpl;
import com.tecsoluction.restaurante.service.impl.UsuarioServicoImpl;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.assertNotNull;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/resources/META-INF/persistence.xml",
        "file:src/main/webapp/WEB-INF/spring/spring-security.xml",
})
public class BancoControllerTest {

    @Autowired
    private
    BancoServicoImpl bancoService;

    @Autowired
    private
    UsuarioServicoImpl userservice;

    @Autowired
    private WebApplicationContext wac;


    private MockMvc mockMvc;

    //
    @Before
    public void setUp() throws Exception {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();

    }
//
//    @After
//    public void tearDown() throws Exception {
//    }
//


    @Test
    public void contexLoads() throws Exception {
        assertNotNull(bancoService);
        assertNotNull(userservice);
    }


    @Test
    public void cadastrarEntity() throws Exception {
//        ResultActions resultActions = mockMvc.perform(get("/banco/cadastro").accept(MediaType.ALL));
//        resultActions.andExpect(status().isOk());
//        resultActions.andExpect(view().name("cadastrarbanco"));

    }

    @Test
    public void adicionarEntity() throws Exception {
    }

    @Test
    public void movimentacaoEntity() throws Exception {
    }

    @Test
    public void editarEntityForm() throws Exception {
    }

    @Test
    public void editarEntity() throws Exception {
    }

    @Test
    public void deletarEntity() throws Exception {
    }

}