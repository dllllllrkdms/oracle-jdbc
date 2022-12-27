package vo;

public class Member {
	
	// 정보 은닉과 캡슐화 
	private String memberId; // PK
	private String memberPw;
	private String memberName;
	private String updatedate;
	private String createdate;
	
	// 오버라이딩
	@Override // 부모메서드를 자식타입에서 재정의 
	public String toString() { // 디버깅 시 객체멤버를 출력할 때 사용
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", updatedate=" + updatedate + ", createdate=" + createdate + "]";
	}
	// 생성자 오버로딩
	public Member() {} // 기본
		
	public Member(String memberId, String memberPw, String memberName, String updatedate, String createdate) {
		super(); // 매개변수로 멤버변수를 다 가진 생성자
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.updatedate = updatedate;
		this.createdate = createdate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}