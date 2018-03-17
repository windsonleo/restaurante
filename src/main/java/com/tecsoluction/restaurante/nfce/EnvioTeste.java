//package com.tecsoluction.restaurante.nfce;
//
//import java.util.Base64;
//
//import javax.xml.bind.JAXBElement;
//import javax.xml.bind.JAXBException;
//import javax.xml.namespace.QName;
//
//import br.com.samuelweb.certificado.Certificado;
//import br.com.samuelweb.certificado.CertificadoService;
//import br.com.samuelweb.certificado.exception.CertificadoException;
//import br.com.samuelweb.nfe.Nfe;
//import br.com.samuelweb.nfe.dom.ConfiguracoesIniciaisNfe;
//import br.com.samuelweb.nfe.dom.Enum.StatusEnum;
//import br.com.samuelweb.nfe.exception.NfeException;
//import br.com.samuelweb.nfe.util.ConstantesUtil;
//import br.com.samuelweb.nfe.util.Estados;
//import br.com.samuelweb.nfe.util.NFCeUtil;
//import br.com.samuelweb.nfe.util.WebServiceUtil;
//import br.com.samuelweb.nfe.util.XmlUtil;
//import br.inf.portalfiscal.nfe.*;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TEnderEmi;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TEnviNFe;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.*;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto.COFINS;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto.COFINS.COFINSAliq;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto.ICMS;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto.ICMS.ICMS60;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto.PIS;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Imposto.PIS.PISAliq;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Det.Prod;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Emit;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Ide;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TNFe.InfNFe.Total.ICMSTot;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TRetEnviNFe;
//import br.inf.portalfiscal.nfe.schema_4.enviNFe.TUfEmi;
//
//public class EnvioTeste {
//
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//	
//	
//	
//		try {
//
//            iniciaConfiguracoes();
//
//            TNFe nfe = new TNFe();
//            InfNFe infNFe = new InfNFe();
//            infNFe.setId("XXX");
//            infNFe.setVersao("4.00");
//
//            Ide ide = new Ide();
//            ide.setCUF("XXX");
//            ide.setCNF("XXX");
//            ide.setNatOp("XXX");
//            ide.setMod("65");
//            ide.setSerie("1");
//            ide.setNNF("XXX");
//            ide.setDhEmi("XXX");
//            ide.setTpNF("XXX");
//            ide.setIdDest("XXX");
//            ide.setCMunFG("XXX");
//            ide.setTpImp("4");
//            ide.setTpEmis("XXX");
//            ide.setCDV("XXX");
//            ide.setTpAmb("XXX");
//            ide.setFinNFe("XXX");
//            ide.setIndFinal("XXX");
//            ide.setIndPres("XXX");
//            ide.setProcEmi("XXX");
//            ide.setVerProc("XXX");
//            infNFe.setIde(ide);
//
//            //Emitente
//            Emit emit = new Emit();
//            emit.setCNPJ("XXX");
//            emit.setXNome("XXX");
//            TEnderEmi enderEmit = new TEnderEmi();
//            enderEmit.setXLgr("XXX");
//            enderEmit.setNro("XXX");
//            enderEmit.setXCpl("XXX");
//            enderEmit.setXBairro("XXX");
//            enderEmit.setCMun("XXX");
//            enderEmit.setXMun("XXX");
//            enderEmit.setUF(TUfEmi.valueOf("XXX"));
//            enderEmit.setCEP("XXX");
//            enderEmit.setCPais("XXX");
//            enderEmit.setXPais("XXX");
//            enderEmit.setFone("XXX");
//            emit.setEnderEmit(enderEmit);
//            emit.setIE("XXX");
//            emit.setCRT("XXX");
//            infNFe.setEmit(emit);
//
//            // Destinatario
//            Dest dest = new Dest();
//            dest.setCPF("XXX");
//            dest.setXNome("XXX");
//            dest.setIndIEDest("XXX");
//            infNFe.setDest(dest);
//
//            
//            Det det = new Det();
//            det.setNItem("1");
//
//            // Produto
//            Prod prod = new Prod();
//            prod.setCProd("XXX");
//            prod.setCEAN("XXX");
//            prod.setXProd("XXX");
//            prod.setNCM("XXX");
//            prod.setCEST("XXX");
//            prod.setIndEscala("XXX");
//            prod.setCFOP("XXX");
//            prod.setUCom("XXX");
//            prod.setQCom("XXX");
//            prod.setVUnCom("XXX");
//            prod.setVProd("XXX");
//            prod.setCEANTrib("XXX");
//            prod.setUTrib("XXX");
//            prod.setQTrib("XXX");
//            prod.setVUnTrib("XXX");
//            prod.setIndTot("XXX");
//            det.setProd(prod);
//
//            //Impostos
//            Imposto imposto = new Imposto();
//            ICMS icms = new ICMS();
//            ICMS60 icms60 = new ICMS60();
//            icms60.setOrig("XXX");
//            icms60.setCST("XXX");
//            icms60.setVBCSTRet("XXX");
//            icms60.setPST("XXX");
//            icms60.setVICMSSTRet("XXX");
//            icms.setICMS60(icms60);
//
//            PIS pis = new PIS();
//            PISAliq pisAliq = new PISAliq();
//            pisAliq.setCST("XXX");
//            pisAliq.setVBC("XXX");
//            pisAliq.setPPIS("XXX");
//            pisAliq.setVPIS("XXX");
//            pis.setPISAliq(pisAliq);
//
//            COFINS cofins = new COFINS();
//            COFINSAliq cofinsAliq = new COFINSAliq();
//            cofinsAliq.setCST("XXX");
//            cofinsAliq.setVBC("XXX");
//            cofinsAliq.setPCOFINS("XXX");
//            cofinsAliq.setVCOFINS("XXX");
//            cofins.setCOFINSAliq(cofinsAliq);
//
//            JAXBElement<ICMS> icmsElement = new JAXBElement<ICMS>(new QName("ICMS"), ICMS.class, icms);
//            imposto.getContent().add(icmsElement);
//
//            JAXBElement<PIS> pisElement = new JAXBElement<PIS>(new QName("PIS"), PIS.class, pis);
//            imposto.getContent().add(pisElement);
//
//            JAXBElement<COFINS> cofinsElement = new JAXBElement<COFINS>(new QName("COFINS"), COFINS.class, cofins);
//            imposto.getContent().add(cofinsElement);
//
//            det.setImposto(imposto);
//            infNFe.getDet().add(det);
//
//            // TOTAIS
//            Total total = new Total();
//
//            ICMSTot icmstot = new ICMSTot();
//            icmstot.setVBC("XXX");
//            icmstot.setVICMS("XXX");
//            icmstot.setVICMSDeson("XXX");
//            icmstot.setVFCP("XXX");
//            icmstot.setVFCPST("XXX");
//            icmstot.setVFCPSTRet("XXX");
//            icmstot.setVBCST("XXX");
//            icmstot.setVST("XXX");
//            icmstot.setVProd("XXX");
//            icmstot.setVFrete("XXX");
//            icmstot.setVSeg("XXX");
//            icmstot.setVDesc("XXX");
//            icmstot.setVII("XXX");
//            icmstot.setVIPI("XXX");
//            icmstot.setVIPIDevol("XXX");
//            icmstot.setVPIS("XXX");
//            icmstot.setVCOFINS("XXX");
//            icmstot.setVOutro("XXX");
//            icmstot.setVNF("XXX");
//            total.setICMSTot(icmstot);
//            infNFe.setTotal(total);
//
//            Transp transp = new Transp();
//            transp.setModFrete("9");
//            infNFe.setTransp(transp);
//
//            InfAdic infAdic = new InfAdic();
//            infAdic.setInfCpl("XXX");
//            infNFe.setInfAdic(infAdic);
//
//            Pag pag = new Pag();
//            Pag.DetPag detPag = new Pag.DetPag();
//            detPag.setTPag("XXX");
//            detPag.setVPag("XXX");
//            pag.getDetPag().add(detPag);
//
//            infNFe.setPag(pag);
//
//            nfe.setInfNFe(infNFe);
//
//            // Monta EnviNfe
//            TEnviNFe enviNFe = new TEnviNFe();
//            enviNFe.setVersao("4.00");
//            enviNFe.setIdLote("1");
//            enviNFe.setIndSinc("1");
//            enviNFe.getNFe().add(nfe);
//
//            // Monta e Assina o XML
//            enviNFe = Nfe.montaNfe(enviNFe, true);
//
//            //QRCODE
//            String qrCode = NFCeUtil.getCodeQRCode(
//                    infNFe.getId().substring(3),
//                    "100",
//                    ide.getTpAmb(),
//                    dest.getCNPJ() == null ? dest.getCPF() : dest.getCNPJ(),
//                    ide.getDhEmi(),
//                    total.getICMSTot().getVNF(),
//                    total.getICMSTot().getVICMS(),
//                    Base64.getEncoder().encodeToString(enviNFe.getNFe().get(0).getSignature().getSignedInfo().getReference().getDigestValue()),
//                    "000001",
//                    "0123456789",
//                    WebServiceUtil.getUrl(ConstantesUtil.NFCE, ConstantesUtil.SERVICOS.URL_QRCODE));
//
//            TNFe.InfNFeSupl infNFeSupl = new TNFe.InfNFeSupl();
//            infNFeSupl.setQrCode(qrCode);
//            infNFeSupl.setUrlChave(WebServiceUtil.getUrl(ConstantesUtil.NFCE, ConstantesUtil.SERVICOS.URL_CONSULTANFCE));
//            enviNFe.getNFe().get(0).setInfNFeSupl(infNFeSupl);
//
//            // Envia a Nfe para a Sefaz
//            TRetEnviNFe retorno = Nfe.enviarNfe(enviNFe, ConstantesUtil.NFCE);
//
//            if (!retorno.getCStat().equals(StatusEnum.LOTE_PROCESSADO.getCodigo())) {
//                throw new NfeException("Status:" + retorno.getCStat() + " - Motivo:" + retorno.getXMotivo());
//            }
//
//            if (!retorno.getProtNFe().getInfProt().getCStat().equals(StatusEnum.AUTORIZADO.getCodigo())) {
//                throw new NfeException("Status:" + retorno.getProtNFe().getInfProt().getCStat() + " - Motivo:" + retorno.getProtNFe().getInfProt().getXMotivo());
//            }
//
//            System.out.println("Status:" + retorno.getProtNFe().getInfProt().getCStat());
//            System.out.println("Motivo:" + retorno.getProtNFe().getInfProt().getXMotivo());
//            System.out.println("Data:" + retorno.getProtNFe().getInfProt().getDhRecbto());
//            System.out.println("Protocolo:" + retorno.getProtNFe().getInfProt().getNProt());
//
//            System.out.println("Xml Final :" + XmlUtil.criaNfeProc(enviNFe, retorno.getProtNFe()));
//
//        } catch (NfeException | JAXBException | CertificadoException e) {
//            System.out.println("Erro:" + e.getMessage());
//        }
//
//    }
//
//	
//	 public static ConfiguracoesIniciaisNfe iniciaConfiguracoes() throws NfeException, CertificadoException {
//			// Certificado Windows
//		 
//			Certificado certificado = CertificadoService.certificadoPfx("C:\\NFCE\\CERT\\Associacao.pfx", "associacao");
//
//			ConfiguracoesIniciaisNfe config = ConfiguracoesIniciaisNfe.iniciaConfiguracoes(Estados.PE , ConstantesUtil.AMBIENTE.HOMOLOGACAO,certificado, "C:\\NFCE\\SCHEMA\\schemas");
//
////			Certificado certificado = CertificadoService.listaCertificadosWindows().get(aliasCertificado);
//			
//			String ip = "192.168.15.9";
//			int porta = 8081;
//			String usuario ="";
//			String senha = "";
//
//			config.setProxy(ip, porta, usuario , senha);
//			config.setContigenciaSCAN(true);
//				
//			return config ;
//			
//			
//			
//		}
//	
//	
//	}
//
