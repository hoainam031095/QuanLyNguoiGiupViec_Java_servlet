//===check dang ky tai khoan==
	$(document).ready(function() {
		$.validator.addMethod("check",function(value, element,regex) {
            //return this.optional(element) || regex.test(value);
            //or
            return regex.test(value);
			});
		$(".submit-dk-taikhoan").validate({
				rules:{
					hovaten:{
						required: true,
						minlength:2
					},
					matkhau:{
						required:true,
					},
					email:{
						required: true,
//						minlength:11,
//						check:/[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}/igm,
					},
					sodienthoai:{
						required: true,
						minlength:10,
						check:/^\+?\d{1,4}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/,
					},
					
				},
				messages:{
						hovaten:{
		                    required: "Vui lòng nhập tên!",
		                    minlength: "Tên quá ngắn mời nhập lại!"
		                },
		                matkhau:{
							required:"Vui lòng nhập mật khẩu!"
						},
						email:{
							required: "Vui lòng nhập mail!",
//		                    minlength: "Email quá ngắn mời nhập lại!",
//		                    check:"Email không hợp lệ!"
						},
						sodienthoai:{
							required: "Vui lòng nhập phone!",
		                    minlength: "Phone quá ngắn mời nhập lại!",
		                    check:"Phone không hợp lệ!"
						},
		            },
			});
	
			$(".submit").click(function(){
				$(".submit-dk-taikhoan").submit();
			});
			
//			check confim pass
			
			$('.matkhau').on('keyup',function(){
				if($('.confimmatkhau').val().trim() != $('.matkhau').val().trim()){
					$('#dktk-error-confimmk').html("Vui lòng nhập lại mật khẩu!");
				}
				else $('#dktk-error-confimmk').html("");
			});
			$('.confimmatkhau').on('keyup',function(){
				if($('.confimmatkhau').val().trim() != $('.matkhau').val().trim()){
					$('#dktk-error-confimmk').html("Mật khẩu không trùng khớp!");
				}
				else $('#dktk-error-confimmk').html("");
			});

//			check so dien thoai
			$('.sodienthoai').blur(function() {
				$.ajax({
					url:'ThemMoiNguoiDungServlet',
					data:{
						sodienthoai:$('.sodienthoai').val().trim(),
					},
					success: function(responseText){
						if(responseText != ""){
							$('.sodienthoai').val(responseText);
						}
					}
				});
				
			});
			
	});
			
