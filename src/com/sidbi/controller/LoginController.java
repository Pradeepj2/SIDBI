package com.sidbi.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.sidbi.model.BankRegistrationModel;
import com.sidbi.model.SidbiUserRegistration;
import com.sidbi.service.BankRegistrationService;
import com.sidbi.service.LoanUserRegistrationService;
import com.sidbi.model.User;
import com.sidbi.service.UserRegistrationService;

@Controller
public class LoginController {

	@Autowired
	UserRegistrationService userRegService;

	@Autowired
	SessionFactory sessionFactory;

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
	}

	@RequestMapping("index")
	public ModelAndView login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		ModelAndView mv = new ModelAndView("index");

		return mv;
	}

	@RequestMapping("loginAction")
	public ModelAndView loginDetailsCheck(HttpServletRequest request, RedirectAttributes redirectAttributes,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("index");

		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			if (email != null && password != null) {
				String ifExist = userRegService.checkLogin(email, password);
				String username = (String) request.getSession().getAttribute("username");
				if (ifExist == null) {

					mv.addObject("msg",
							"<div class=\"alert alert-danger\"><b>Failure !</b>Please Enter correct username and password.</div> \r\n");
				} else {

					String usernameString = userRegService.getUsername(email);
					String roletype = userRegService.getroletype(email);
					session.setAttribute("username", usernameString);
					session.setAttribute("roleType", roletype);
					session.setAttribute("email", email);

					mv = new ModelAndView((View) new RedirectView("dashboardview.obj"));
				}

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}

	/////////////////////////////////////////////////////////////////////////////////////
	////////////////////////// Pradeeps
	///////////////////////////////////////////////////////////////////////////////////// controller//////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////

	@Autowired
	LoanUserRegistrationService loanUserRegistrationService;

	@Autowired
	BankRegistrationService bankRegistrationService;

	@RequestMapping("dashboardview")
	public ModelAndView viewDashbord(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		ModelAndView mView = new ModelAndView("dashboard2");

		List<Long> list = bankRegistrationService.countRequestofPfi();
		mView.addObject("listOfPfiCount", list);

		return mView;

	}

	@RequestMapping("registation")
	public ModelAndView registrationForm(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		ModelAndView modelAndView = new ModelAndView("Registration");
		List<Object[]> banksList = loanUserRegistrationService.getAllRegisteredBanks();
		modelAndView.addObject("banksList", banksList);
		return modelAndView;
	}

	@RequestMapping(value = "saveLoanUserRegistration", method = RequestMethod.POST)
	public ModelAndView saveLoanUserRegistration(HttpServletRequest request,
			@RequestParam("panCard") final MultipartFile panCard,
			@RequestParam("aadharCard") final MultipartFile aadharCard)
			throws ParseException, IllegalStateException, IOException {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		final File theDir = new File("C:\\Users\\pradeep.rathor\\DocumentOfSidbi\\loanDocument");

		if (!theDir.exists()) {
			theDir.mkdirs();
		}

		final String panCardName = panCard.getOriginalFilename();
		final String aadharCardName = aadharCard.getOriginalFilename();
		File serverFileForPan = new File(theDir, panCardName);
		File serverFileForAadhar = new File(theDir, aadharCardName);
		panCard.transferTo(serverFileForPan);
		aadharCard.transferTo(serverFileForAadhar);

		String nameString = request.getParameter("name");
		String emaiString = request.getParameter("email");
		String contactString = request.getParameter("contact");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dobString = request.getParameter("dob");
		Date dob = simpleDateFormat.parse(dobString);
		String occupation = request.getParameter("occupation");
		String companyName = request.getParameter("companyName");
		String empId = request.getParameter("empId");
		String loanApplyFor = request.getParameter("loanApplyFor");
		String vehicleNo = request.getParameter("vehicleNo");
		String bankName = request.getParameter("bankName");
		int annualIncome = Integer.parseInt(request.getParameter("annualIncome"));
		int downPayment = Integer.parseInt(request.getParameter("downPayment"));
		int desiredLoan = Integer.parseInt(request.getParameter("desiredLoan"));

		SidbiUserRegistration sidbiUserRegistration = new SidbiUserRegistration();
		sidbiUserRegistration.setName(nameString);
		sidbiUserRegistration.setEmail(emaiString);
		sidbiUserRegistration.setContact(contactString);
		sidbiUserRegistration.setDob(dob);
		sidbiUserRegistration.setOccupation(occupation);
		sidbiUserRegistration.setCompanyName(companyName);
		sidbiUserRegistration.setEmpId(empId);
		sidbiUserRegistration.setLoanApplyFor(loanApplyFor);
		sidbiUserRegistration.setVehicleNo(vehicleNo);
		sidbiUserRegistration.setAnnualIncome(annualIncome);
		sidbiUserRegistration.setDesiredLoan(desiredLoan);
		sidbiUserRegistration.setDownPayment(downPayment);
		sidbiUserRegistration.setPanCard(panCardName);
		sidbiUserRegistration.setAadharCard(aadharCardName);
		sidbiUserRegistration.setBankName(bankName);

		System.out.println(sidbiUserRegistration.toString());

		loanUserRegistrationService.createOrUpdate(sidbiUserRegistration);

		return new ModelAndView(new RedirectView("LoadAllLoanApplicantsList.obj"));
	}

	@RequestMapping("LoadAllLoanApplicantsList")
	public ModelAndView listOfAllApplicants(HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		ModelAndView mv = new ModelAndView("LoadAllLoanApplicants");
		List<SidbiUserRegistration> applications = loanUserRegistrationService.loadAllLoanApplication();

		mv.addObject("loanApplications", applications);
		mv.addObject("bankName", "");
		return mv;
	}

	@RequestMapping("/editStatus")
	public ModelAndView editStatus(HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		String s1 = request.getParameter("setIt");
		String s2 = request.getParameter("reqId");
		int setTo = Integer.parseInt(request.getParameter("setIt"));
		int id = Integer.parseInt(request.getParameter("reqId"));

		SidbiUserRegistration user = loanUserRegistrationService.getById(id);
		user.setBankStatus(setTo);
		user.setSentToSidbiStatus(setTo);
		loanUserRegistrationService.createOrUpdate(user);

		return new ModelAndView(new RedirectView("LoadAllLoanApplicantsList.obj"));
	}

	@RequestMapping("bankToSidbiRequest")
	public ModelAndView bankToSidbi(HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		ModelAndView mv = new ModelAndView("BankToSidbiUserRegistration");
		List<Integer> applications = loanUserRegistrationService.listOfAllBankApproved();
		mv.addObject("loanApplications", applications);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "getSingleResponse", method = { RequestMethod.GET })
	public Object getResponse(@RequestParam("id") int id, HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		SidbiUserRegistration user = loanUserRegistrationService.getById(id);
		System.err.println(user.toString());

		Gson gson = new Gson();
		return gson.toJson(user);

	}

	@RequestMapping("sendToSidbiRequest")
	public ModelAndView sendToSidbi(@RequestParam("appId") int id, HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		SidbiUserRegistration user = loanUserRegistrationService.getById(id);

		user.setSentToSidbiStatus(1);

		loanUserRegistrationService.createOrUpdate(user);
		return new ModelAndView(new RedirectView("bankToSidbiRequest.obj"));

	}

	@RequestMapping("approvedBySidbi")
	public ModelAndView approvedBySidbi(@RequestParam("reqId") int id, @RequestParam("setIt") int setIt,
			HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		SidbiUserRegistration user = loanUserRegistrationService.getById(id);

		user.setSidbiStatus(setIt);

		loanUserRegistrationService.createOrUpdate(user);
		return new ModelAndView(new RedirectView("getAllSentSidbi.obj"));

	}

	@RequestMapping("getAllSentSidbi")
	public ModelAndView getAllSentSidbiuser(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		ModelAndView mv = new ModelAndView("sidbiPortalUserPendingList");
		List<Object[]> applications = loanUserRegistrationService.getAllSentSidbi();
		mv.addObject("loanApplications", applications);
		return mv;
	}

	// bank registration
	@RequestMapping("bankRegistration")
	public ModelAndView bankRegistration(HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		System.err.println("called");
		ModelAndView modelAndView = new ModelAndView("BankRegistration");
		return modelAndView;
	}

	@RequestMapping(value = "saveBankRegistration", method = RequestMethod.POST)
	public ModelAndView saveBankRegistration(HttpServletRequest request, @RequestParam("docs") final MultipartFile docs)
			throws ParseException, IllegalStateException, IOException {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		final File theDir = new File("C:\\Users\\pradeep.rathor\\DocumentOfSidbi\\BankRegistration");

		if (!theDir.exists()) {
			theDir.mkdirs();
		}

		final String docsName = docs.getOriginalFilename();
		File serverFileForDocs = new File(theDir, docsName);
		docs.transferTo(serverFileForDocs);

		String pfi = request.getParameter("pfi");
		String rbiLicence = request.getParameter("rbiLicence");
		String applyFor = request.getParameter("applyFor");
		String business = request.getParameter("business");
		String npa = request.getParameter("npa");
		String WillingShare = request.getParameter("WillingShare");

		BankRegistrationModel bankRegistrationModel = new BankRegistrationModel();
		bankRegistrationModel.setPfiName(pfi);
		bankRegistrationModel.setRbiLicence(rbiLicence);
		bankRegistrationModel.setMinTwoYearBusiness(business);
		bankRegistrationModel.setNPA(npa);
		bankRegistrationModel.setWillingShare(WillingShare);
		bankRegistrationModel.setApplyFor(applyFor);
		bankRegistrationModel.setDocs(docsName);
		// System.out.println(bankRegistration().toString());

		bankRegistrationService.createOrUpdate(bankRegistrationModel);

		return new ModelAndView(new RedirectView("LoadAllBankRegistration.obj"));
	}

	@RequestMapping("LoadAllBankRegistration")
	public ModelAndView listOfBanksApplicants(HttpServletRequest request) {

		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		ModelAndView mv = new ModelAndView("LoadAllBankRegistration");
		List<BankRegistrationModel> applications = bankRegistrationService.loadAllBanksApplication();
		mv.addObject("bankApplications", applications);

		return mv;
	}

	@RequestMapping("/approveBank")
	public ModelAndView approveBankRequest(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}

		int id = Integer.parseInt(request.getParameter("reqId"));

		BankRegistrationModel user = bankRegistrationService.getById(id);
		user.setApproved(1);
		bankRegistrationService.createOrUpdate(user);

		return new ModelAndView(new RedirectView("LoadAllBankRegistration.obj"));
	}

	@RequestMapping("LoadAllApprovedBank")
	public ModelAndView LoadAllApprovedBank(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		ModelAndView mv = new ModelAndView("LoadAllApprovedBank");
		List<String> listOfApprovedBanks = bankRegistrationService.getAllApprovedBanks();
		mv.addObject("listOfApprovedBanks", listOfApprovedBanks);
		return mv;
	}

	@RequestMapping("fetchUserForBank")
	public ModelAndView fetchUserForBank(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		ModelAndView mv = new ModelAndView("UsersOfSpecificBanks");
		String bankNameString = request.getParameter("bank");
		List<Object[]> users = bankRegistrationService.getAllUserOfBank(bankNameString);
		mv.addObject("loanApplications", users);
		mv.addObject("bankName", bankNameString);
		return mv;
	}

	@RequestMapping("loginForSidbi")
	public ModelAndView loginForSidbi(HttpServletRequest request) {
		String roletype = (String) request.getSession().getAttribute("roleType");

		if (roletype == null) {
			return new ModelAndView("index");
		}
		ModelAndView mv = new ModelAndView("LoginForSidbi");
		return mv;
	}

}
