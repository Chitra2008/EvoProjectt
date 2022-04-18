package com.mastek.demo.model;
public class Employee {
	
	private int empId, amount, reqId, postdetailsid, validate, nationId;
	
	private String empName, empEmail, depart, destination, travelDate, 
	accom, advance, button1, status, epass;
	
	private String nation, dob, doj, passport, gender, dept ;
	
	


	public int getNationId() {
		return nationId;
	}



	public void setNationId(int nationId) {
		this.nationId = nationId;
	}



	public int getValidate() {
		return validate;
	}



	public void setValidate(int validate) {
		this.validate = validate;
	}



	public int getPostdetailsid() {
		return postdetailsid;
	}



	public String getNation() {
		return nation;
	}



	public void setNation(String nation) {
		this.nation = nation;
	}



	public String getDob() {
		return dob;
	}



	public void setDob(String dob) {
		this.dob = dob;
	}



	public String getDoj() {
		return doj;
	}



	public void setDoj(String doj) {
		this.doj = doj;
	}



	public String getPassport() {
		return passport;
	}



	public void setPassport(String passport) {
		this.passport = passport;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getDept() {
		return dept;
	}



	public void setDept(String dept) {
		this.dept = dept;
	}



	public void setPostdetailsid(int postdetailsid) {
		this.postdetailsid = postdetailsid;
	}



	
	public String getEpass() {
		return epass;
	}



	public void setEpass(String epass) {
		this.epass = epass;
	}



	public int getEmpId() {
		return empId;
	}



	public void setEmpId(int empId) {
		this.empId = empId;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public int getReqId() {
		return reqId;
	}



	public void setReqId(int reqId) {
		this.reqId = reqId;
	}


	public String getEmpName() {
		return empName;
	}



	public void setEmpName(String empName) {
		this.empName = empName;
	}



	public String getEmpEmail() {
		return empEmail;
	}



	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}



	public String getDepart() {
		return depart;
	}



	public void setDepart(String depart) {
		this.depart = depart;
	}



	public String getDestination() {
		return destination;
	}



	public void setDestination(String destination) {
		this.destination = destination;
	}



	public String getTravelDate() {
		return travelDate;
	}



	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}



	public String getAccom() {
		return accom;
	}



	public void setAccom(String accom) {
		this.accom = accom;
	}



	public String getAdvance() {
		return advance;
	}



	public void setAdvance(String advance) {
		this.advance = advance;
	}



	public String getButton1() {
		return button1;
	}



	public void setButton1(String button1) {
		this.button1 = button1;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", amount=" + amount + ", reqId=" + reqId + ", postdetailsid="
				+ postdetailsid + ", validate=" + validate + ", empName=" + empName + ", empEmail=" + empEmail
				+ ", depart=" + depart + ", destination=" + destination + ", travelDate=" + travelDate + ", accom="
				+ accom + ", advance=" + advance + ", button1=" + button1 + ", status=" + status + ", epass=" + epass
				+ ", nation=" + nation + ", dob=" + dob + ", doj=" + doj + ", passport=" + passport + ", gender="
				+ gender + ", dept=" + dept + "]";
	}






}
