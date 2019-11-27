<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<button id=refund>ȯ���ϱ�</button>
	<button id=bt>BT</button>
	<script>
		$("#refund").on("click", function() {
			console.log("refundtest�� ����")
			$(location).attr("href","Refund.refund");
		});

		var IMP = window.IMP; 
		IMP.init("imp97337518"); 
		$("#bt").on("click", function() {
			IMP.request_pay({
				pg : "inicis",
				pay_method : "card",
				merchant_uid : "ORD0011",	// ������Ұ�
				name : "�븣���� ȸ�� ����",		// �������Ͻ�   ó���� �� N�� 
				amount : 100,				// ���� ����
				buyer_email : "asdf@naver.com",		// �̸��� �Է�
				buyer_name : "ȫ�浿",		// �̸�
				buyer_tel : "010-4242-4242",		//��ȭ��ȣ
				buyer_addr : "����Ư���� ������ �Ż絿", 	//addr1 + addr2 
				buyer_postcode : "01181"	// �����ȣ
			}, function(rsp) { // callback
				console.log(rsp);
				if (rsp.success) {
					$.ajax({
						url:"buyComplet.buy",
						type:"post",
						data:rsp,
						dataType:"json"
					})
				}		
				 else {
				}
			});
		})
	</script>
</body>
</html>